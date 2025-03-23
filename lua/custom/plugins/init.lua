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
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = '5. Diary',
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = '%Y-%m-%d',
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = '%B %-d, %Y',
        -- Optional, default tags to add to each new daily note created.
        default_tags = { 'daily-notes' },
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = nil,
      },

      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ['gf'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes.
        ['<leader>ch'] = {
          action = function()
            return require('obsidian').util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
        -- Smart action depending on context, either follow link or toggle checkbox.
        ['<cr>'] = {
          action = function()
            return require('obsidian').util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },

      ui = {
        enable = true,
      },
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
    'sainnhe/gruvbox-material',

    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = 'hard'
    end,
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
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xx',
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

      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldcolumn = '0'
      vim.o.foldlevel = 99
      vim.opt.foldlevelstart = 99
      vim.o.foldenable = true

      local newOpts = {}
      for k, v in pairs(opts) do
        if k == 'open_fold_hl_timeout' then
          v = 0
        end
        newOpts[k] = v
      end

      require('ufo').setup(newOpts)

      vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })
      -- vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds, { desc = 'Fold less' })
      -- vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith, { desc = 'Fold more' })
      -- vim.keymap.set('n', 'zp', require('ufo').peekFoldedLinesUnderCursor, { desc = 'Peek fold' })
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
      require('octo').setup {
        use_local_fs = false, -- use local files on right side of reviews
        enable_builtin = true, -- shows a list of builtin actions when no action is provided
        default_remote = { 'upstream', 'origin' }, -- order to try remotes
        default_merge_method = 'commit', -- default merge method which should be used for both `Octo pr merge` and merging from picker, could be `commit`, `rebase` or `squash`
        default_delete_branch = false, -- whether to delete branch when merging pull request with either `Octo pr merge` or from picker (can be overridden with `delete`/`nodelete` argument to `Octo pr merge`)
        ssh_aliases = {
          ['github.com-chaitanya-lgtm'] = 'github.com',
          ['github.com-Chaitanya-Shahare'] = 'github.com',
        }, -- SSH aliases. e.g. `ssh_aliases = {["github.com-work"] = "github.com"}`. The key part will be interpreted as an anchored Lua pattern.
        picker = 'telescope', -- or "fzf-lua"
        picker_config = {
          use_emojis = false, -- only used by "fzf-lua" picker for now
          mappings = { -- mappings for the pickers
            open_in_browser = { lhs = '<C-b>', desc = 'open issue in browser' },
            copy_url = { lhs = '<C-y>', desc = 'copy url to system clipboard' },
            checkout_pr = { lhs = '<C-o>', desc = 'checkout pull request' },
            merge_pr = { lhs = '<C-r>', desc = 'merge pull request' },
          },
        },
        comment_icon = '▎', -- comment marker
        outdated_icon = '󰅒 ', -- outdated indicator
        resolved_icon = ' ', -- resolved indicator
        reaction_viewer_hint_icon = ' ', -- marker for user reactions
        commands = {}, -- additional subcommands made available to `Octo` command
        users = 'search', -- Users for assignees or reviewers. Values: "search" | "mentionable" | "assignable"
        user_icon = ' ', -- user icon
        ghost_icon = '󰊠 ', -- ghost icon
        timeline_marker = ' ', -- timeline marker
        timeline_indent = '2', -- timeline indentation
        right_bubble_delimiter = '', -- bubble delimiter
        left_bubble_delimiter = '', -- bubble delimiter
        github_hostname = '', -- GitHub Enterprise host
        snippet_context_lines = 4, -- number or lines around commented lines
        gh_cmd = 'gh', -- Command to use when calling Github CLI
        gh_env = {}, -- extra environment variables to pass on to GitHub CLI, can be a table or function returning a table
        timeout = 5000, -- timeout for requests between the remote server
        default_to_projects_v2 = false, -- use projects v2 for the `Octo card ...` command by default. Both legacy and v2 commands are available under `Octo cardlegacy ...` and `Octo cardv2 ...` respectively.
        ui = {
          use_signcolumn = false, -- show "modified" marks on the sign column
          use_signstatus = true, -- show "modified" marks on the status column
        },
        issues = {
          order_by = { -- criteria to sort results of `Octo issue list`
            field = 'CREATED_AT', -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
            direction = 'DESC', -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
          },
        },
        reviews = {
          auto_show_threads = true, -- automatically show comment threads on cursor move
          focus = 'right', -- focus right buffer on diff open
        },
        runs = {
          icons = {
            pending = '🕖',
            in_progress = '🔄',
            failed = '❌',
            succeeded = '',
            skipped = '⏩',
            cancelled = '✖',
          },
        },
        pull_requests = {
          order_by = { -- criteria to sort the results of `Octo pr list`
            field = 'CREATED_AT', -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
            direction = 'DESC', -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
          },
          always_select_remote_on_create = false, -- always give prompt to select base remote repo when creating PRs
        },
        notifications = {
          current_repo_only = false, -- show notifications for current repo only
        },
        file_panel = {
          size = 10, -- changed files panel rows
          use_icons = true, -- use web-devicons in file panel (if false, nvim-web-devicons does not need to be installed)
        },
        colors = { -- used for highlight groups (see Colors section below)
          white = '#ffffff',
          grey = '#2A354C',
          black = '#000000',
          red = '#fdb8c0',
          dark_red = '#da3633',
          green = '#acf2bd',
          dark_green = '#238636',
          yellow = '#d3c846',
          dark_yellow = '#735c0f',
          blue = '#58A6FF',
          dark_blue = '#0366d6',
          purple = '#6f42c1',
        },
        mappings_disable_default = false, -- disable default mappings if true, but will still adapt user mappings
        mappings = {
          runs = {
            expand_step = { lhs = 'o', desc = 'expand workflow step' },
            open_in_browser = { lhs = '<C-b>', desc = 'open workflow run in browser' },
            refresh = { lhs = '<C-r>', desc = 'refresh workflow' },
            copy_url = { lhs = '<C-y>', desc = 'copy url to system clipboard' },
          },
          issue = {
            close_issue = { lhs = '<localleader>ic', desc = 'close issue' },
            reopen_issue = { lhs = '<localleader>io', desc = 'reopen issue' },
            list_issues = { lhs = '<localleader>il', desc = 'list open issues on same repo' },
            reload = { lhs = '<C-r>', desc = 'reload issue' },
            open_in_browser = { lhs = '<C-b>', desc = 'open issue in browser' },
            copy_url = { lhs = '<C-y>', desc = 'copy url to system clipboard' },
            add_assignee = { lhs = '<localleader>aa', desc = 'add assignee' },
            remove_assignee = { lhs = '<localleader>ad', desc = 'remove assignee' },
            create_label = { lhs = '<localleader>lc', desc = 'create label' },
            add_label = { lhs = '<localleader>la', desc = 'add label' },
            remove_label = { lhs = '<localleader>ld', desc = 'remove label' },
            goto_issue = { lhs = '<localleader>gi', desc = 'navigate to a local repo issue' },
            add_comment = { lhs = '<localleader>ca', desc = 'add comment' },
            delete_comment = { lhs = '<localleader>cd', desc = 'delete comment' },
            next_comment = { lhs = ']c', desc = 'go to next comment' },
            prev_comment = { lhs = '[c', desc = 'go to previous comment' },
            react_hooray = { lhs = '<localleader>rp', desc = 'add/remove 🎉 reaction' },
            react_heart = { lhs = '<localleader>rh', desc = 'add/remove ❤️ reaction' },
            react_eyes = { lhs = '<localleader>re', desc = 'add/remove 👀 reaction' },
            react_thumbs_up = { lhs = '<localleader>r+', desc = 'add/remove 👍 reaction' },
            react_thumbs_down = { lhs = '<localleader>r-', desc = 'add/remove 👎 reaction' },
            react_rocket = { lhs = '<localleader>rr', desc = 'add/remove 🚀 reaction' },
            react_laugh = { lhs = '<localleader>rl', desc = 'add/remove 😄 reaction' },
            react_confused = { lhs = '<localleader>rc', desc = 'add/remove 😕 reaction' },
          },
          pull_request = {
            checkout_pr = { lhs = '<localleader>po', desc = 'checkout PR' },
            merge_pr = { lhs = '<localleader>pm', desc = 'merge commit PR' },
            squash_and_merge_pr = { lhs = '<localleader>psm', desc = 'squash and merge PR' },
            rebase_and_merge_pr = { lhs = '<localleader>prm', desc = 'rebase and merge PR' },
            list_commits = { lhs = '<localleader>pc', desc = 'list PR commits' },
            list_changed_files = { lhs = '<localleader>pf', desc = 'list PR changed files' },
            show_pr_diff = { lhs = '<localleader>pd', desc = 'show PR diff' },
            add_reviewer = { lhs = '<localleader>va', desc = 'add reviewer' },
            remove_reviewer = { lhs = '<localleader>vd', desc = 'remove reviewer request' },
            close_issue = { lhs = '<localleader>ic', desc = 'close PR' },
            reopen_issue = { lhs = '<localleader>io', desc = 'reopen PR' },
            list_issues = { lhs = '<localleader>il', desc = 'list open issues on same repo' },
            reload = { lhs = '<C-r>', desc = 'reload PR' },
            open_in_browser = { lhs = '<C-b>', desc = 'open PR in browser' },
            copy_url = { lhs = '<C-y>', desc = 'copy url to system clipboard' },
            goto_file = { lhs = 'gf', desc = 'go to file' },
            add_assignee = { lhs = '<localleader>aa', desc = 'add assignee' },
            remove_assignee = { lhs = '<localleader>ad', desc = 'remove assignee' },
            create_label = { lhs = '<localleader>lc', desc = 'create label' },
            add_label = { lhs = '<localleader>la', desc = 'add label' },
            remove_label = { lhs = '<localleader>ld', desc = 'remove label' },
            goto_issue = { lhs = '<localleader>gi', desc = 'navigate to a local repo issue' },
            add_comment = { lhs = '<localleader>ca', desc = 'add comment' },
            delete_comment = { lhs = '<localleader>cd', desc = 'delete comment' },
            next_comment = { lhs = ']c', desc = 'go to next comment' },
            prev_comment = { lhs = '[c', desc = 'go to previous comment' },
            react_hooray = { lhs = '<localleader>rp', desc = 'add/remove 🎉 reaction' },
            react_heart = { lhs = '<localleader>rh', desc = 'add/remove ❤️ reaction' },
            react_eyes = { lhs = '<localleader>re', desc = 'add/remove 👀 reaction' },
            react_thumbs_up = { lhs = '<localleader>r+', desc = 'add/remove 👍 reaction' },
            react_thumbs_down = { lhs = '<localleader>r-', desc = 'add/remove 👎 reaction' },
            react_rocket = { lhs = '<localleader>rr', desc = 'add/remove 🚀 reaction' },
            react_laugh = { lhs = '<localleader>rl', desc = 'add/remove 😄 reaction' },
            react_confused = { lhs = '<localleader>rc', desc = 'add/remove 😕 reaction' },
            review_start = { lhs = '<localleader>vs', desc = 'start a review for the current PR' },
            review_resume = { lhs = '<localleader>vr', desc = 'resume a pending review for the current PR' },
            resolve_thread = { lhs = '<localleader>rt', desc = 'resolve PR thread' },
            unresolve_thread = { lhs = '<localleader>rT', desc = 'unresolve PR thread' },
          },
          review_thread = {
            goto_issue = { lhs = '<localleader>gi', desc = 'navigate to a local repo issue' },
            add_comment = { lhs = '<localleader>ca', desc = 'add comment' },
            add_suggestion = { lhs = '<localleader>sa', desc = 'add suggestion' },
            delete_comment = { lhs = '<localleader>cd', desc = 'delete comment' },
            next_comment = { lhs = ']c', desc = 'go to next comment' },
            prev_comment = { lhs = '[c', desc = 'go to previous comment' },
            select_next_entry = { lhs = ']q', desc = 'move to next changed file' },
            select_prev_entry = { lhs = '[q', desc = 'move to previous changed file' },
            select_first_entry = { lhs = '[Q', desc = 'move to first changed file' },
            select_last_entry = { lhs = ']Q', desc = 'move to last changed file' },
            close_review_tab = { lhs = '<C-c>', desc = 'close review tab' },
            react_hooray = { lhs = '<localleader>rp', desc = 'add/remove 🎉 reaction' },
            react_heart = { lhs = '<localleader>rh', desc = 'add/remove ❤️ reaction' },
            react_eyes = { lhs = '<localleader>re', desc = 'add/remove 👀 reaction' },
            react_thumbs_up = { lhs = '<localleader>r+', desc = 'add/remove 👍 reaction' },
            react_thumbs_down = { lhs = '<localleader>r-', desc = 'add/remove 👎 reaction' },
            react_rocket = { lhs = '<localleader>rr', desc = 'add/remove 🚀 reaction' },
            react_laugh = { lhs = '<localleader>rl', desc = 'add/remove 😄 reaction' },
            react_confused = { lhs = '<localleader>rc', desc = 'add/remove 😕 reaction' },
            resolve_thread = { lhs = '<localleader>rt', desc = 'resolve PR thread' },
            unresolve_thread = { lhs = '<localleader>rT', desc = 'unresolve PR thread' },
          },
          submit_win = {
            approve_review = { lhs = '<C-a>', desc = 'approve review', mode = { 'n', 'i' } },
            comment_review = { lhs = '<C-m>', desc = 'comment review', mode = { 'n', 'i' } },
            request_changes = { lhs = '<C-r>', desc = 'request changes review', mode = { 'n', 'i' } },
            close_review_tab = { lhs = '<C-c>', desc = 'close review tab', mode = { 'n', 'i' } },
          },
          review_diff = {
            submit_review = { lhs = '<localleader>vs', desc = 'submit review' },
            discard_review = { lhs = '<localleader>vd', desc = 'discard review' },
            add_review_comment = { lhs = '<localleader>ca', desc = 'add a new review comment', mode = { 'n', 'x' } },
            add_review_suggestion = { lhs = '<localleader>sa', desc = 'add a new review suggestion', mode = { 'n', 'x' } },
            focus_files = { lhs = '<localleader>e', desc = 'move focus to changed file panel' },
            toggle_files = { lhs = '<localleader>b', desc = 'hide/show changed files panel' },
            next_thread = { lhs = ']t', desc = 'move to next thread' },
            prev_thread = { lhs = '[t', desc = 'move to previous thread' },
            select_next_entry = { lhs = ']q', desc = 'move to next changed file' },
            select_prev_entry = { lhs = '[q', desc = 'move to previous changed file' },
            select_first_entry = { lhs = '[Q', desc = 'move to first changed file' },
            select_last_entry = { lhs = ']Q', desc = 'move to last changed file' },
            close_review_tab = { lhs = '<C-c>', desc = 'close review tab' },
            toggle_viewed = { lhs = '<localleader><space>', desc = 'toggle viewer viewed state' },
            goto_file = { lhs = 'gf', desc = 'go to file' },
          },
          file_panel = {
            submit_review = { lhs = '<localleader>vs', desc = 'submit review' },
            discard_review = { lhs = '<localleader>vd', desc = 'discard review' },
            next_entry = { lhs = 'j', desc = 'move to next changed file' },
            prev_entry = { lhs = 'k', desc = 'move to previous changed file' },
            select_entry = { lhs = '<cr>', desc = 'show selected changed file diffs' },
            refresh_files = { lhs = 'R', desc = 'refresh changed files panel' },
            focus_files = { lhs = '<localleader>e', desc = 'move focus to changed file panel' },
            toggle_files = { lhs = '<localleader>b', desc = 'hide/show changed files panel' },
            select_next_entry = { lhs = ']q', desc = 'move to next changed file' },
            select_prev_entry = { lhs = '[q', desc = 'move to previous changed file' },
            select_first_entry = { lhs = '[Q', desc = 'move to first changed file' },
            select_last_entry = { lhs = ']Q', desc = 'move to last changed file' },
            close_review_tab = { lhs = '<C-c>', desc = 'close review tab' },
            toggle_viewed = { lhs = '<localleader><space>', desc = 'toggle viewer viewed state' },
          },
          notification = {
            read = { lhs = '<localleader>rn', desc = 'mark notification as read' },
          },
        },
      }
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
