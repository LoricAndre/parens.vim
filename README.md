# Parens.vim
This is my attempt at an auto-closing plugin for vim/neovim.

## Behavior
 - This will auto-close `'`, `"`, `(`, `[`, `{` and place the cursor between the two.
 - This will ONLY auto-close them if the nex char is a whitespace (or if it's empty), this is why I created the plugin.
 - This will not handle the <CR> behaviors.
