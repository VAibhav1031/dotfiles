--- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)


vim.opt.number = true --line number
vim.opt.relativenumber = true --Relative line numbers
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true 
vim.opt.syntax = "on"

vim.opt.clipboard:prepend("unnamedplus")  -- instead of = "unnamedplus"


vim.g.mapleader = " " -- Space as a leader
vim.g.maplocalleader = " "

vim.opt.timeoutlen = 500

-- Install Treesitter for better syntax highlighting (built-in, no plugins needed)
require("lazy").setup({
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.config",  -- Lets lazy handle the require safely
    opts = {
      ensure_installed = { "lua", "vim", "python", "javascript" ,"C"},  -- Your languages
      highlight = { enable = true },
      -- Add more later if needed: indent = { enable = true }, etc.
    },
  },
  -- Add future plugins here
  -- Example 1: Adding Telescope (fuzzy finder)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },  -- most plugins need this
    keys = {                                    -- load only when you press these keys
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Search Text" },
    },
  },

    {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    config = function()
      require("nvim-tree").setup {}
    end,
  },
--   {
--     "nvim-neo-tree/neo-tree.nvim",
--     version = "*",
--     lazy = false,
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       "MunifTanjim/nui.nvim",
--       "nvim-tree/nvim-web-devicons",
--     },
--     config = function()
--         require("neo-tree").setup {}
--     end,
-- },

  {
  "nvim-tree/nvim-web-devicons",  -- File icons
  lazy = true,                    -- Loads only when needed (fast startup)
},



{
  "AlexvZyl/nordic.nvim",
  lazy = false, 
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme nordic]])
  end,
},

{
  "folke/tokyonight.nvim",
   lazy = false,
  -- config = function()
  --  priority = 1000,
  -- require("tokyonight").setup({ style = "moon" })  -- "storm", "moon", "day" (light)
  --   vim.cmd.colorscheme "tokyonight"
  -- end,
},

{
    "rebelot/kanagawa.nvim",
    lazy = true,
  },

{
    "ellisonleao/gruvbox.nvim",
    lazy = true,
  },

-- catpuccin
{
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "latte", -- "latte" is the light version of Catppuccin
      })
    end
  },

{
 "EdenEast/nightfox.nvim",
 name = "nightfox",
 -- priority = 1000,
 --
 -- config = function()
 --    require('nightfox').setup({
 --      style = dawnfox, 
 --      options = {
 --        styles = {
 --          comments = "italic",
 --          keywords = "bold",
 --          types = "italic,bold",
 --        }
 --      }
 --    })
 --
 --  vim.cmd([[colorscheme nightfox]])
 --  end
},

-- everforest
{
    "sainnhe/everforest",
    lazy=true,
},

-- -- Add this inside the setup brackets { }
--   {
--     "DanilaMihailov/beacon.nvim",
--     config = function()
--       require("beacon").setup({
--         enable = true,
--         size = 40,
--         fade = true,
--       })
--     end,
--   },

})

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)  -- Open file explorer
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
-- vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle NeoTree" })
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })

require("user.some_")



-- NEOVIDE GUI SETTINGS 
if vim.g.neovide then

    vim.g.my_animation_enabled = true
    local function toggle_animations()
        vim.g.my_animation_enabled = not vim.g.my_animation_enabled

        if vim.g.my_animation_enabled then
            vim.g.neovide_cursor_vfx_mode = "pixiedust"
            print("Neovide Effects: ON 🌑")
        else
            vim.g.neovide_cursor_vfx_mode = ""
            print("Neovide Effects: Off ")
        end
    end

   
    local function change_animations()
        
        if vim.g.neovide_cursor_vfx_mode == "ripple" then
            vim.g.neovide_cursor_vfx_mode = "pixiedust"
            print("Changed to 'pixiedust'")
        else
            vim.g.neovide_cursor_vfx_mode = "ripple"
            print("Changed to 'ripple' 🌊")
        end
    end

-- little bit my way trying
    local my_table = {"ripple","pixiedust","railgun","magic","sonic"}
    local index = 1
    local function new_animation_toggle()
        index = (index % #my_table) + 1
        current_mode = my_table[index]
        vim.g.neovide_cursor_vfx_mode = current_mode

        if current_mode == "magic" then
            vim.g.neovide_cursor_vfx_particle_lifetime = 2.0  -- Long, floating life
            vim.g.neovide_cursor_vfx_particle_density = 30.0   -- Very sparkly
        elseif current_mode == "sonic" then
            vim.g.neovide_cursor_vfx_particle_lifetime = 0.8  -- Short, fast burst
            vim.g.neovide_cursor_vfx_particle_density = 15.0
        end

        local message  = string.format("Changed to : %s",current_mode)
        print(message)
        
    end
-- i-ci-ve: Insert, Command-Insert, Visual-Ex -> 'ver25' (35% width vertical bar)

    vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver35-Cursor,r:hor20-Cursor"
   
    -- 1. The Green Cursor Color
    vim.api.nvim_set_hl(0, 'Cursor', { bg = '#00FF00', fg = '#000000' })
    
    -- -- -- 2. The Snake/Trail Animation
    vim.g.neovide_cursor_animation_length = 0.15  -- Speed
    vim.g.neovide_cursor_trail_size = 0.5         -- Tail length
    
    -- 3. The Particle Effect (The "Flash" on movement)
    -- Options: "railgun", "ripple", "pixiedust", "magic", "sonic"
    -- vim.g.neovide_cursor_vfx_mode = "pixiedust" 
    
    -- 4. Font (Make sure you have a Nerd Font installed)
    vim.o.guifont = "FiraCode Nerd Font:h13" 
 

    -- IMPORTANT ONES --
    vim.g.neovide_refresh_rate = 144 -- Set this to your monitor's Hz (60, 120, 144)
    vim.g.neovide_no_idle = true   -- Forces Neovide to stay active
    
    -- KEYMAPS FOR NEOVIDE

    vim.keymap.set("n","<leader>ta",toggle_animations, {desc = "Toggle Neovide Animations(on/off) "})
    vim.keymap.set("n","<leader>t",new_animation_toggle, {desc = "Change Neovide Animations in loop"})
    vim.keymap.set("n","<leader>ca",change_animations, {desc = "Change Neovide Animations "})

end

