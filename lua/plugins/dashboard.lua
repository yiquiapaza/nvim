return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-mini/mini.icons', version = '*' },
    config = function()
        require('dashboard').setup()
    end,
}
