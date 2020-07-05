#!/usr/bin/env bash

VERSION="0.0";

if [[ -z "$DISPLAY" ]]; then
    DISPLAY=":1";
    export DISPLAY;
fi

title="";
prompt="";
description="";
keyinfo="";

ask_password() {
  dmenu -P -p "$prompt" 2> /dev/null;
}

save_option() {
  echo "OK";
}

get_info() {
  case "$1" in
    version) echo "D $VERSION" && echo "OK" ;;
    pid) echo "D $BASHPID" && echo "OK" ;;
    *) echo "ERR 280 IPC parameter error <Unspecified source>" ;;
  esac;
}

password_prompt() {
  if pass=$(ask_password); then
    [[ ! -z "$pass" ]] && echo "D $pass";
    echo "OK";
  else
    echo "ERR 99 Operation cancelled <Unspecified source>";
  fi;
}

echo "OK Pleased to meet you";
while read line; do
  cmd="$(echo "$line" | cut -d' ' -f1)";
  data="$(echo "$line" | cut -d' ' -f2-)";

  case "$cmd" in
    OPTION) save_option "$data" ;;
    GETINFO) get_info "$data" ;;
    SETTITLE) title="$data" && echo "OK" ;;
    SETPROMPT) prompt="$data" && echo "OK" ;;
    SETDESC) description="$data" && echo "OK" ;;
    SETKEYINFO) keyinfo="$data" && echo "OK" ;;
    GETPIN) password_prompt ;;
    BYE) echo "OK closing connection" && exit 0; ;;
    *) echo "OK" ;;
  esac;
done;

      #{ "SETREPEAT",  cmd_setrepeat },
      #{ "SETREPEATERROR", cmd_setrepeaterror },
      #{ "SETERROR",   cmd_seterror },
      #{ "SETOK",      cmd_setok },
      #{ "SETNOTOK",   cmd_setnotok },
      #{ "SETCANCEL",  cmd_setcancel },
      #{ "CONFIRM",    cmd_confirm },
      #{ "MESSAGE",    cmd_message },
      #{ "SETQUALITYBAR", cmd_setqualitybar },
      #{ "SETQUALITYBAR_TT", cmd_setqualitybar_tt },
      #{ "SETTIMEOUT", cmd_settimeout },
      #{ "CLEARPASSPHRASE", cmd_clear_passphrase },

