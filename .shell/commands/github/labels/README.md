# Github Label Command For Bash



## Usage

You will need to set the variable `GITHUBTOKEN` which will be set from the environment variables in a super script, but for independant running it will need to be set manually. 

### Create a new label

There is an example labels.json file which you can use and update to add your own labels. It will delete all existing labels for the repo, and then it will upload the list from the labels.json file.


You can just run the command with no arguments to see the usage.


```bash
  labels.sh
```

The script will then use a github token, and ask you for the  org name and which repo to target.

After you enter those it will run till the labels are made. 

### The Labels

Below are charts describing all of the common labels and colors across the many orginization repos.


Label | Color | Hex | Description
--- | --- | --- | ---
blocker | ![](https://dummyimage.com/100x20/000000&amp;text=+) | `#000000` | Blocker for the next release.
bug | ![](https://dummyimage.com/100x20/ee0701&amp;text=+) | `#ee0701` | A bug.
bug/sporadic test failure | ![](https://dummyimage.com/100x20/ee0701&amp;text=+) | `#ee0701` | A bug that manifests as test failures in an unpredictable way.
cleanup | ![](https://dummyimage.com/100x20/fef2c0&amp;text=+) | `#fef2c0` | Changes only making the code cleaner and that do not change how the code works nor the outputs produced (e.g. rubocop or eslint changes).
dependencies | ![](https://dummyimage.com/100x20/b4a8d1&amp;text=+) | `#b4a8d1` | Changes that affect dependencies, such as gem changes.
developer | ![](https://dummyimage.com/100x20/bcf5db&amp;text=+) | `#bcf5db` | Changes that affect developers only, including non-customer-facing tools (e.g. changes to bin/setup)
documentation | ![](https://dummyimage.com/100x20/d4c5f9&amp;text=+) | `#d4c5f9` | Changes to documentation only (e.g. README.md).
duplicate | ![](https://dummyimage.com/100x20/eeeeee&amp;text=+) | `#eeeeee` | The issue is a duplicate.  When applied, the duplicate issue should be referenced in a comment.
enhancement | ![](https://dummyimage.com/100x20/84b6eb&amp;text=+) | `#84b6eb` | An enhancement.
help wanted | ![](https://dummyimage.com/100x20/0e8a16&amp;text=+) | `#0e8a16` | An issue that could be handled by anyone, even new members of the community.
internationalization | ![](https://dummyimage.com/100x20/d4c5f9&amp;text=+) | `#d4c5f9` | Changes that are for internationalization only (e.g. updating the *.po gettext files).
notabug | ![](https://dummyimage.com/100x20/eeeeee&amp;text=+) | `#eeeeee` | The issue is not a bug as reported or not reproducible.  When applied the issue should be closed.
performance | ![](https://dummyimage.com/100x20/e99695&amp;text=+) | `#e99695` | Changes that are for performance improvements only.
pinned | ![](https://dummyimage.com/100x20/eeeeee&amp;text=+) | `#eeeeee` | Issues ignored with the stale label.
question | ![](https://dummyimage.com/100x20/cc317c&amp;text=+) | `#cc317c` | Issues that are just questions.  When the question is resolved, the label should be changed and/or the issue should be closed.
refactoring | ![](https://dummyimage.com/100x20/fbca04&amp;text=+) | `#fbca04` | Changes in the way the code works internally without changing the output produced.  Contrast to "cleanup".
stale | ![](https://dummyimage.com/100x20/eeeeee&amp;text=+) | `#eeeeee` | The issue is old and hasn't had activity in 6 months.
technical debt | ![](https://dummyimage.com/100x20/ff7619&amp;text=+) | `#ff7619` | Changes that remove or significantly update old unused code and/or dependencies.
test | ![](https://dummyimage.com/100x20/bfe5bf&amp;text=+) | `#bfe5bf` | Changes to test code only.
tools | ![](https://dummyimage.com/100x20/bcf5db&amp;text=+) | `#bcf5db` | Changes to customer-facing tools Contrast to "developer".
unmergeable | ![](https://dummyimage.com/100x20/eeeeee&amp;text=+) | `#eeeeee` | The PR is unmergeable.  This label is automatically applied and removed.
verified | ![](https://dummyimage.com/100x20/0e8a16&amp;text=+) | `#0e8a16` | The bug issue was reviewed and is verified to have the problem stated and a PR should be created.  This label is not necessary on a bug PR.
wip | ![](https://dummyimage.com/100x20/eeeeee&amp;text=+) | `#eeeeee` | The PR is a WIP.  This label is automatically applied and removed or not.
wontfix | ![](https://dummyimage.com/100x20/eeeeee&amp;text=+) | `#eeeeee` | The issue will not be fixed or otherwise handled.  When applied, the issue should be closed.
