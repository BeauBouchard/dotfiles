#!/usr/bin/env bash

## requires exturnal functions such as 
# echo_warn, echo_color, echo_color_n
source ../../utils.sh

main() {
	CAT=$(input_create_delete)
	ORG=$(input_user "What org?")
	REPO=$(input_user "What repo?")
	echo_color $WHITE "org:${ORG} repo:${REPO} CAT:${CAT}";
	# create_labels
}

input_create_delete() {
	while true; do
		# get user's input and convert to lowercase with sed
		local INPUT=$(input_user "Would you like to create labels or delete labels? [create/delete]" | sed -e "s/\(.*\)/\L\1/")
    case ${INPUT} in
      create) s
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
	while IFS= read -r LABELNAME && IFS= read -r LABELCOLOR; do
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

		create_label ${LABELNAME} ${LABELDESCRIPTION} ${LABELCOLOR}
	done < <(jq -r "[] as $o | (.[$o].name, .[$o].description, .[$o].color)" $(path/abs)/labels.json)
}

create_label() {
	curl -X POST \
		--header "Authorization: token ${GITHUBTOKEN}" \
		--header "Content-Type: application/json" \
		--data "{\"name\":\"$1\",\"description\":\"$2\", \"color\":\"$3\"}" \
			"https://api.github.com/repos/${ORG}/${REPO}/labels"
}

get_labels() {
  LABELS=$(curl -X GET \
		--header "Authorization: token ${GITHUBTOKEN}" \
		--header "Content-Type: application/json" \
		"https://api.github.com/repos/${ORG}/${REPO}/labels")

  LABELCOUNT=$(echo $LABELS | jq ". | length")
}

delete_labels() {
	get_labels
  while IFS= read -r LABELNAME; do
		echo_color_n $WHITE "["
		echo_color_n $RED "DELETE"
		echo_color_n $WHITE "][" 
		echo_color_n $RED "LABEL"
		echo_color $WHITE "] Deleting Label " 
		echo_color_n $WHITE "Name: " 
		echo_color $CYAN "${LABELNAME}"

    delete_label ${LABELNAME}
  done < <(echo $LABELS | jq -r "[] as $o | (.[$o].name)")
}

delete_label() {
	# replace spaces with %20
	LABELNAME=$(echo $1 | sed -e "s/ /%20/g")
	curl -X DELETE \
		--header "Authorization: token ${GITHUBTOKEN}" \
		--header "Content-Type: application/json" \
		"https://api.github.com/repos/${ORG}/${REPO}/labels/$LABELNAME"
}

main
