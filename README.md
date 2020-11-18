# Introduction to Interactive Media
Code examples for the NYU Abu Dhabi class IM-UH 1010.

## Usage


### Initialization (you only need to do these steps once):
If you haven't installed git on your computer, [install git on your computer](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) (or optionally here's [a different set of instructions](https://www.linode.com/docs/development/version-control/how-to-install-git-on-linux-mac-and-windows/)).

Change directory (`cd` on the command line) into the location where you want the class repository to live.

Clone the repo to your computer: `git clone https://github.com/aaronsherwood/introduction_interactive_media.git`

### Regular Use:
If working off any example, copy that example somewhere outside of the repo to mitigate any merge conflicts later on.

To get new examples: `git pull`

If you're unsure if you've been working in examples directly in the repo you can stash everything before pulling:
* `git stash`
* `git pull`

To get stashed code back: `git stash pop`

To see what's been stashed: `git stash list`

To remove all stashes: `git stash clear`

To reset everything to be just like the repo online:
* `git fetch origin`
* `git reset --hard origin/master`


