if vim.g.vscode then
    require('sets')
    require('functions')
    print('here')
else
    vim.cmd("source ~/.config/nvim/plug_load.vim")
    vim.cmd("source ~/.config/nvim/mappings.vim")
    require('sets')
    require('functions')
    require('setups')
end
