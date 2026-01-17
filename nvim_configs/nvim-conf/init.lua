--plugin manager
vim.pack.add({
  -- Core Functionality
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch="master"},
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/hrsh7th/nvim-cmp" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/L3MON4D3/LuaSnip" }, -- Engine for snippets

-- Themes
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  { src = "https://github.com/AlexvZyl/nordic.nvim" },
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/ellisonleao/gruvbox.nvim" },
  { src = "https://github.com/rebelot/kanagawa.nvim" },
  { src = "https://github.com/EdenEast/nightfox.nvim" },

  -- { src = "https://github.com/sainnhe/everforest", branch="master"},
})

vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Or '■', '▎', 'x'
        source = "always", -- Shows if it's from Ruff or Basedpyright
    },
    float = {
        border = "rounded",
        source = "always",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})


-- 1. Create the 'handshake' (capabilities)
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('basedpyright', { capabilities = capabilities })
vim.lsp.config('ruff', { capabilities = capabilities })

local cmp = require('cmp')
cmp.setup({
  snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter to confirm
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer'},
    { name = 'path' },
  })
})



vim.opt.completeopt = { "menu", "menuone", "noselect" }

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


-- LSP Section
vim.lsp.enable("basedpyright")
vim.lsp.enable("ruff") 


--new one doesnt need s in config
require("nvim-treesitter.config").setup({ 
  ensure_installed = { "lua", "vim", "python", "javascript", "c" },
  highlight = { enable = true },
})
--
      -- needed: indent = { enable = true }
require("nvim-tree").setup()
require("telescope").setup ()
-- require("nvim-lspconfig").setup()
require("nvim-web-devicons").setup()



-- theme Setup
require("catppuccin").setup({
    transparent_background = true,
    flavour = "mocha",
})


require("nightfox").setup({
  options = {
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold",
    }
  }
})

-- require("everforest").setup()
require("gruvbox").setup()
require("tokyonight").setup({
    style = "moon"
})  -- "storm", "moon", "day" (light)


--nordic-fav-theme
require('nordic').setup({
    -- This callback can be used to override the colors used in the base palette.
    on_palette = function(palette) end,
    -- This callback can be used to override the colors used in the extended palette.
    after_palette = function(palette) end,
    -- This callback can be used to override highlights before they are applied.
    on_highlight = function(highlights, palette) end,
    -- Enable bold keywords.
    bold_keywords = false,
    -- Enable italic comments.
    italic_comments = true,
    -- Enable editor background transparency.
    transparent = {
        -- Enable transparent background.
        bg = false,
        -- Enable transparent background for floating windows.
        float = false,
    },
    -- Enable brighter float border.
    bright_border = false,
    -- Reduce the overall amount of blue in the theme (diverges from base Nord).
    reduced_blue = true,
    -- Swap the dark background with the normal one.
    swap_backgrounds = false,
    -- Cursorline options.  Also includes visual/selection.
    cursorline = {
        -- Bold font in cursorline.
        bold = false,
        -- Bold cursorline number.
        bold_number = true,
        -- Available styles: 'dark', 'light'.
        theme = 'dark',
        -- Blending the cursorline bg with the buffer bg.
        blend = 0.85,
    },
    noice = {
        -- Available styles: `classic`, `flat`.
        style = 'classic',
    },
    telescope = {
        -- Available styles: `classic`, `flat`.
        style = 'flat',
    },
    leap = {
        -- Dims the backdrop when using leap.
        dim_backdrop = false,
    },
    ts_context = {
        -- Enables dark background for treesitter-context window
        dark_background = true,
    }
})




--calling the colorscheme 
vim.cmd.colorscheme("torte")





--
--KEYMAPS
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
--keymaps for telescope(outside the setup call)
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")




-- gd = "Go to Definition" (Jumps to the source code file)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to source code" })

-- gr = "Go to References" (Shows everywhere this function is used)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Show usage" })

-- K = "Hover" (Opens a floating window showing the docstring/types)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Show documentation" })

-- gi = "Go to Implementation"
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to implementation" })
--peak aboo and see in split
vim.keymap.set('n', 'gv', function()
  vim.cmd('vsplit')
  vim.lsp.buf.definition()
end, { desc = "Peek definition in vertical split" })

----
----
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
        local current_mode = my_table[index]
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


