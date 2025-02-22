-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { -- Auto Pairs
    'jiangmiao/auto-pairs',
  },

  { -- Vim Surround
    'tpope/vim-surround',
  },

  { -- Harpoon
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    config = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup {}
      -- REQUIRED

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set('n', '<leader>j', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<leader>k', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<leader>l', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<leader>;', function()
        harpoon:list():select(4)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end)
    end,
  },

  { -- Copilot
    'github/copilot.vim',
  },
  { -- Copilot Chat

    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    -- config = function()
    --   require('CopilotChat').setup {}
    -- end,
    opts = {},
  },
  { -- Telescope

    'akinsho/toggleterm.nvim',
    --config = function()
    --  local Terminal = require('toggleterm.terminal').Terminal
    --  local lazygit = Terminal:new { cmd = 'lazygit', dir = 'git_dir', direction = 'float', float_opts = {
    --    border = 'single',
    --  } }

    --  ---@diagnostic disable-next-line: lowercase-global
    --  function _lazygit_toggle()
    --    lazygit:toggle()
    --  end

    --  vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
    --end,
  },

  { -- Lazygit
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Lazy[G]it' },
    },
  },
  { -- Vim Fugitive

    'tpope/vim-fugitive',
  },
  { -- Obsidian nvim
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = 'personal',
          -- path = '/Users/chaitanyashahare/Library/Mobile Documents/iCloud~md~obsidian/Documents/vimwiki',
          path = '~/Documents/Personal/personal-wiki/',
        },
      },

      -- see below for full list of options 👇
    },
    keys = {
      { '<leader>op', '<cmd>ObsidianPasteImg<cr>', desc = '[O]bsidian [P]aste Img' },
      { '<leader>w<leader>w', '<cmd>ObsidianToday<cr>', desc = '[O]bsidian Today' },
      { '<leader>w<leader>e', '<cmd>ObsidianTomorrow<cr>', desc = '[O]bsidian Tomorrow' },
      { '<leader>w<leader>q', '<cmd>ObsidianYesterday<cr>', desc = '[O]bsidian Yesterday' },
      { '<leader>ot', '<cmd>ObsidianToggleCheckbox<cr>', desc = '[O]bsidian [T]oggle' },
    },
  },
  { -- Markdown Preview
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
  -- {
  --   'TobinPalmer/pastify.nvim',
  --   cmd = { 'Pastify' },
  --   config = function()
  --     require('pastify').setup {
  --       opts = {
  --         apikey = 'f4d47e559b295f26d680c8da56325202', -- Needed if you want to save online.
  --       },
  --     }
  --   end,
  -- },
  -- {
  --   'ekickx/clipboard-image.nvim',
  -- },
  {
    'rose-pine/neovim',
  },
  {
    'ellisonleao/gruvbox.nvim',
  },
  {
    'Mofiqul/vscode.nvim',
  },
  {
    'shaunsingh/nord.nvim',
  },
  {
    'rebelot/kanagawa.nvim',
  },
  {

    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  {
    'tpope/vim-commentary',
  },
  {

    'christoomey/vim-tmux-navigator',
  },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },

  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  {
    'alvan/vim-closetag',
    config = function()
      vim.cmd [[
let g:closetag_filetypes = 'html,xhtml,jsx,javascript,typescript.tsx'
]]
    end,
  },
  {
    'SmiteshP/nvim-navic',
    config = function()
      require('nvim-navic').setup {
        lsp = {
          auto_attach = true,
        },
      }
    end,
  },
  {
    'folke/zen-mode.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Zen Mode' },
    },
  },

  {
    'kawre/leetcode.nvim',
    build = ':TSUpdate html',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim', -- required by telescope
      'MunifTanjim/nui.nvim',

      -- optional
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      -- configuration goes here
    },
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    opts = {
      filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('local_detach_ufo', { clear = true }),
        pattern = opts.filetype_exclude,
        callback = function()
          require('ufo').detach()
        end,
      })

      vim.opt.foldlevelstart = 99
      require('ufo').setup(opts)
    end,
  },
  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      -- OR 'ibhagwan/fzf-lua',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('octo').setup()
    end,
  },
  {
    'LunarVim/breadcrumbs.nvim',
    dependencies = {
      { 'SmiteshP/nvim-navic' },
    },
    config = function()
      require('breadcrumbs').setup {}
    end,
  },
}
