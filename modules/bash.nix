{
  programs.bash.promptInit = ''
    set_prompt() {
      # Set color only when running as root (EUID 0)
      if [ "$EUID" -eq 0 ]; then
        local C_START="\[\033[1;31m\]" # Bold Red
        local C_END="\[\033[0m\]"
      else
        local C_START=""
        local C_END=""
      fi

      if [ -n "$IN_NIX_SHELL" ]; then
        if [ "$name" = "shell" ]; then
          PS1="''${C_START}[root](shell) \W \\$ ''${C_END}"
        else
          PS1="''${C_START}[root](dev) \W \\$ ''${C_END}"
        fi
      elif [[ "$PATH" =~ (^|:)/nix/store/[^:]+/bin(:|$) ]] && [[ ! "$PATH" =~ /nix/store/[^:]*neovim[^:]*/bin ]]; then
        PS1="''${C_START}[root](shell) \W \\$ ''${C_END}"
      else
        PS1="''${C_START}[root] \W \\$ ''${C_END}"
      fi
    }
    PROMPT_COMMAND=set_prompt
  '';
}
