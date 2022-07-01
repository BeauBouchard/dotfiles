#!/usr/bin/env bash

## requires exturnal functions such as
# echo_warn, echo_color, echo_color_n
source ~/.shell/utils.sh

main() {
	CAT=$(input_create_delete)
	ORG=$(input_user "What org?")
	REPO=$(input_user "What repo?")
	echo_color $WHITE "org:${ORG} repo:${REPO} CAT:${CAT}";
	if [ "$CAT" == "create" ]; then
			echo_color $WHITE "Creating labels...";
			create_labels $ORG $REPO;
	elif [ "$CAT" == "delete" ]; then
			echo_color $WHITE "Deleting labels...";
			delete_labels $ORG $REPO;
	else
			echo_warn "Invalid input";
			return 1;
	fi

}

input_create_delete() {
	while true; do
		# get user's input and convert to lowercase with sed
		local INPUT=$(input_user "Would you like to create labels or delete labels? [create/delete]" | sed -e "s/\(.*\)/\L\1/")
    case ${INPUT} in
      create)
				echo $INPUT
				return 1 ;;
      delete)
				echo $INPUT
				return 2 ;;
      *) echo_warn "${INPUT} is invalid input, please type 'create' or 'delete'"
    esac
  done
}

create_labels() {
	while IFS= read -r LABELNAME && IFS= read -r LABELCOLOR && IFS= read -r LABELDESCRIPTION; do
		echo_color_n $WHITE "["
		echo_color_n $GREEN "CREATE"
		echo_color_n $WHITE "]["
		echo_color_n $GREEN "LABELS"
		echo_color $WHITE "] Creating Labels for "
		echo_color_n $WHITE "Name: "
		echo_color $CYAN "${LABELNAME}"
		echo_color_n $WHITE "Description: "
		echo_color $CYAN "${LABELDESCRIPTION}"
		echo_color_n $WHITE "Color: "
		echo_color $CYAN "${LABELCOLOR}"

		create_label "${LABELNAME}" "${LABELDESCRIPTION}" "${LABELCOLOR}" "$1" "$2"
	done < <(jq -r ".[] | .name, .color, .description" ./labels.json)
}

create_label() {
	curl -X POST \
		--header "Authorization: token ${GITHUBTOKEN}" \
		--header "Content-Type: application/json" \
		--data "{\"name\":\"$1\",\"description\":\"$2\", \"color\":\"$3\"}" \
			"https://api.github.com/repos/${4}/${5}/labels"
}

get_labels() {
  LABELS=$(curl -X GET \
		--header "Authorization: token ${GITHUBTOKEN}" \
		--header "Content-Type: application/json" \
		"https://api.github.com/repos/${1}/${2}/labels")

  LABELCOUNT=$(echo $LABELS | jq ". | length")
}

delete_labels() {
	get_labels $1 $2
  while IFS= read -r LABELNAME; do
		echo_color_n $WHITE "["
		echo_color_n $RED "DELETE"
		echo_color_n $WHITE "]["
		echo_color_n $RED "LABEL"
		echo_color $WHITE "] Deleting Label "
		echo_color_n $WHITE "Name: "
		echo_color $CYAN "${LABELNAME}"

    delete_label "${LABELNAME}" $1 $2
  done < <(echo $LABELS | jq -r ".[] | .name")
}

delete_label() {
	# replace spaces with %20
	LABELNAME=$(echo $1 | sed -e "s/ /%20/g")
	curl -X DELETE \
		--header "Authorization: token ${GITHUBTOKEN}" \
		--header "Content-Type: application/json" \
		"https://api.github.com/repos/${2}/${3}/labels/$LABELNAME"
}

main
