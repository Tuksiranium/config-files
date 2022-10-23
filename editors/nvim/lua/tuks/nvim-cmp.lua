-- Setup nvim-cmp.
local servers = require'lspconfig'

local cmp = require("cmp")
vim.opt.completeopt = "menu,menuone,noselect"
local luasnip = require("luasnip")

if not luasnip then
  return
end

local ELLIPSIS_CHAR = '…'
local MAX_LABEL_WIDTH = 20

local lsp_symbols = {
  Text = " ι  ",
  Method = " β  ",
  Function = " λ  ",
  Constructor = "   ",
  Field = "    ",
  Variable = " α  ",
  Class = " η  ",
  Interface = " κ  ",
  Module = "    ",
  Property = " χ  ",
  Unit = " ψ  ",
  Value = " μ  ",
  Enum = " ξ  ",
  Keyword = " ϕ  ",
  Snippet = " s  ",
  Color = " c  ",
  File = " F  ",
  Reference = " π  ",
  Folder = "   ",
  EnumMember = "    ",
  Constant = " θ  ",
  Struct = " τ  ",
  Event = " ε  ",
  Operator = " ρ  ",
  TypeParameter = " ς  "
}

cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<A-o>"] = cmp.mapping.select_prev_item(),
		["<A-i>"] = cmp.mapping.select_next_item(),
		["<A-u>"] = cmp.mapping.confirm({ select = true }),
		-- 	["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		-- 	["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		-- 	["<C-i>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		--	["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- 	-- Accept currently selected item. If none selected, `select` first item.
		-- 	-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		-- ["<Space><Space>"] = cmp.mapping.confirm({ select = false }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

    },
    formatting = {
      format = function(entry, item)
        -- set Max Label Lenght
        local label = item.abbr
        local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
        if truncated_label ~= label then
            item.abbr = truncated_label .. ELLIPSIS_CHAR
        end
        item.kind = lsp_symbols[item.kind] .. " " .. item.kind
        -- set a name for each source
        item.menu =
          ({
          spell = "[Spell]",
          buffer = "[Buffer]",
          calc = "[Calc]",
          emoji = "[Emoji]",
          nvim_lsp = "[LSP]",
          path = "[Path]",
          look = "[Look]",
          treesitter = "[treesitter]",
          luasnip = "[LuaSnip]",
          nvim_lua = "[Lua]",
          latex_symbols = "[Latex]",
          cmp_tabnine = "[Tab9]"
        })[entry.source.name]
        return item
      end
    },
    sources = {
      {name = "nvim_lsp"},
      {name = "vsnip"},
      {name = "path"},
      {name = "luasnip"},
      {name = "ultisnips"},
      {name = "buffer", max_item_count = 6},
      {name = "nvim_lua"},
      {name = "treesitter"},
      {name = "spell"},
      {name = "calc"},
      {name = "emoji"},
      {name = "look"},
      {name = "latex_symbols"},
      {name = "cmp_tabnine"},
      {name = "neorg"},
      {name = "cmp_luasnip"}
    },
    confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
  }
)

vim.cmd(
  [[
augroup NvimCmp
au!
au FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
augroup END
]]
)

-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

for _, serv in ipairs(servers) do
    require('lspconfig')[serv].setup {
      capabilities = capabilities
    }
end
