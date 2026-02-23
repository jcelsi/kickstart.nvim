-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'ecke/mini.nvim',
    config = function()
      require('mini.tabline').setup({
        show_icons = true, -- muestra iconos de archivos
        tabpage_section = 'right', -- sección de tabs a la derecha
      })

      -- Keybindings para navegar buffers
      vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Siguiente buffer', silent = true })
      vim.keymap.set('n', '<S-Tab>', ':bprev<CR>', { desc = 'Buffer anterior', silent = true })
      vim.keymap.set('n', '<leader>x', ':bd<CR>', { desc = 'Cerrar buffer', silent = true })
    end,
  },
}
