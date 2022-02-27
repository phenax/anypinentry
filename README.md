# AnyPinentry
AnyPinentry is a wrapping interface to all kinds of prompts instead of gnupg's pinentry.
You can now use any interface for password and confirmation prompts (`dmenu`, `rofi`, `read`, `systemd-ask-password`, `curses`, `etc`).

> Note: This is NOT a complete replacement for pinentry programs but it should cover most use-cases. Report any issues you face so the program can be improved

## Dependencies
* bash
* dmenu with password patch (for the default config only)
* notify-send (for the default config only)

## Usage
1. Clone the repo to anywhere on your machine (you should maintain a fork in case you want to configure the default behavior)
2. Run `chmod +x ./anypinentry` inside the cloned directory
3. Edit the script file if you want to configure it. 
4. Edit `~/.gnuph/gpg-agent.conf` (or create it) and add the line `pinentry-program /<path-to-this-repo>/anypinentry`
5. Run `gpg-agent reload` to reload the config or logout and log back in
6. Gpg should now be using your prefered program for pinentry

## Config
The following variables inside `./anypinentry` script file can be configured

* `prompt_action` - Action to show a prompt asking for password
* `confirm_action` - Action to confirm an action (Yes or No)
* `display_error_action` - Action to display error messages to user
