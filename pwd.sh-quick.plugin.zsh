#!/usr/bin/env zsh

-pwd-sh-quick() {
  local i
  for i in "peco" "pwd.sh" "pbcopy"; do
    if ! type "$i" &>/dev/null; then
      echo "$i does not found in your \$PATH" 1>&2
      return 1
    fi
  done

  pwd.sh r all \
    | grep -vE '^($|Done)$' \
    | peco \
    | awk '{print $1}' \
    | pbcopy

  zle accept-line
  zle -R -c
}

autoload -Uz -- -pwd-sh-quick
zle -N -- -pwd-sh-quick

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=zsh sw=2 ts=2 et
