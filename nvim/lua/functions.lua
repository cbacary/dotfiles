-- Functions and auto commands 

vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    command = "NERDTreeClose"
})

local function turn_off_caps()
    local caps_state = vim.fn.matchstr(vim.fn.system('xset -q'), '00: Caps Lock:\\s\\+\\zs\\(on\\|off\\)\\ze')
    if caps_state == 'on' then
        vim.fn.system('xdotool key Caps_Lock')
    end
end

vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = turn_off_caps
})

vim.api.nvim_create_autocmd("User", {
    pattern = "CocJumpPlaceholder",
    callback = function()
        vim.fn.CocActionAsync('showSignatureHelp')
    end
})
