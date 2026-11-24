{
  programs.bash = {
    enable = true;

    initExtra = ''
      set_prompt() {
        if [ -n "$IN_NIX_SHELL" ]; then
          if [ "$name" = "shell" ]; then
            PS1="(shell) \W \$ "
          else
            PS1="(dev) \W \$ "
          fi
        elif [ "$(echo "$PATH" | tr ':' '\n' | grep -c '^/nix/store/.*/bin$')" -gt "$( [ -n "$NVIM" ] && echo 1 || echo 0 )" ]; then
          PS1="(shell) \W \$ "
        else
          PS1="\W \$ "
        fi
      }
      
      PROMPT_COMMAND=set_prompt
    '';
  };
}
