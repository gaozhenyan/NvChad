local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- {
  --   "nvimtools/none-ls.nvim",
  --   event = "VeryLazy",
  --   opts = function ()
  --     return require("custom.configs.null-ls")
  --   end
  -- },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "clangd",
        "clang-format",
        "cmakelang",
        "rust-analyzer",
      },
    },
  },
  {
    "esensar/nvim-dev-container",
    cmd = {"DevcontainerStart", "DevcontainerAttach","DevcontainerExec", "DevcontainerStop", "DevcontainerStopAll", "DevcontainerRemoveAll", "DevcontainerLogs", "DevcontainerEditNearestConfig"},
    config = function ()
      require("devcontainer").setup{}
    end,
    dependencies = 'nvim-treesitter/nvim-treesitter'
  },
  {
    "natecraddock/workspaces.nvim",
    cmd = { "WorkspacesList", "WorkspacesAdd", "WorkspacesOpen", "WorkspacesRemove" },
    config = function()
      require("workspaces").setup {
        hooks = {
          open = "Telescope find_files",
        },
      }
    end,
  },
  {
    "liuchengxu/vista.vim",
    cmd = { "Vista", "Vista", "Vista"},
  },
  {
    'stevearc/aerial.nvim',
    cmd = { "AerialToggle", "AerialOpen" },
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },

  {
    'kdheepak/lazygit.nvim',
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  --[[ {
    "mhartington/formatter.nvim",
    cmd = { "Format", "FormatWrite" },
    config = function()
      require("formatter").setup {
        -- Enable or disable logging
        logging = true,
        -- Set the log level
        log_level = vim.log.levels.WARN,
        -- All formatter configurations are opt-in
        filetype = {
          -- Formatter configurations for filetype "lua" go here
          -- and will be executed in order
          cpp = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require("formatter.filetypes.cpp").clangformat
          },
          c = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require("formatter.filetypes.cpp").clangformat
          },
          cmake = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require("formatter.filetypes.cpp").cmakeformat
          },

          -- Use the special "*" filetype for defining formatter configurations on
          -- any filetype
          ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace
          }
        }
      } 
    end,
  }, ]]
}

return plugins;
