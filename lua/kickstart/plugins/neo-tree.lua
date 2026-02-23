-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- Keymaps based on LazyVim configuration

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  init = function()
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        vim.cmd('Neotree show')
        vim.cmd('wincmd l') -- Keep focus on the file, not Neo-tree
      end,
    })
  end,
  keys = {
    { '<leader>e', ':Neotree toggle<CR>', desc = 'Explorer NeoTree (Root Dir)', silent = true },
    { '<leader>E', ':Neotree toggle dir=' .. vim.fn.getcwd() .. '<CR>', desc = 'Explorer NeoTree (cwd)', silent = true },
    { '<leader>fe', ':Neotree toggle<CR>', desc = 'Explorer NeoTree (Root Dir)', silent = true },
    { '<leader>fE', ':Neotree toggle dir=' .. vim.fn.getcwd() .. '<CR>', desc = 'Explorer NeoTree (cwd)', silent = true },
    { '<leader>ge', ':Neotree toggle source=git_status<CR>', desc = 'Git Explorer', silent = true },
    { '<leader>be', ':Neotree toggle source=buffers<CR>', desc = 'Buffer Explorer', silent = true },
  },
  opts = {
    sources = { 'filesystem', 'buffers', 'git_status' },
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
    window = {
      mappings = {
        ['l'] = 'open',
        ['h'] = 'close_node',
        ['<space>'] = 'none',
        ['Y'] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg('+', path, 'c')
          end,
          desc = 'Copy Path to Clipboard',
        },
        ['P'] = { 'toggle_preview', config = { use_float = false } },
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = '',
        expander_expanded = '',
        expander_highlight = 'NeoTreeExpander',
      },
      git_status = {
        symbols = {
          unstaged = '󰄱',
          staged = '󰱒',
        },
      },
    },
  },
}
