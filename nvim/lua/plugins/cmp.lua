-- Setup global configuration. More on configuration below.
local cmp = require('cmp')
local icons = require('icons')

local lspkind = require('lspkind')
-- local tabnine = require('cmp_tabnine.config')

local has_any_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local press = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

local source_mapping = {
  buffer      = icons.buffer .. '[BUF]',
  calc        = icons.calculator,
  -- cmp_tabnine = icons.light,
  npm         = icons.terminal .. '[NPM]',
  nvim_lsp    = icons.paragraph .. '[LSP]',
  nvim_lua    = icons.bomb,
  path        = icons.folderOpen2,
  treesitter  = icons.tree,
  ultisnips   = icons.snippet,
  zsh         = icons.terminal .. '[ZSH]',
}

cmp.setup {
  snippet = {
        expand = function(args)
            local line_num, col = unpack(vim.api.nvim_win_get_cursor(0))
            local line_text = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, true)[1]
            local indent = string.match(line_text, '^%s*')
            local replace = vim.split(args.body, '\n', true)
            local surround = string.match(line_text, '%S.*') or ''
            local surround_end = surround:sub(col)

            replace[1] = surround:sub(0, col - 1)..replace[1]
            replace[#replace] = replace[#replace]..(#surround_end > 1 and ' ' or '')..surround_end
            if indent ~= '' then
                for i, line in ipairs(replace) do
                    replace[i] = indent..line
                end
            end

            vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, true, replace)
        end,
    },

  -- You must set mapping if you want.
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- ['<Tab>'] = function(fallback)
    --   if vim.fn.complete_info()["selected"] == -1 and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
    --     press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
    --   elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
    --     press("<ESC>:call UltiSnips#JumpForwards()<CR>")
    --   elseif cmp.visible() then
    --     cmp.select_next_item()
    --   elseif has_any_words_before() then
    --     press("<Tab>")
    --   else
    --     fallback()
    --   end
    -- end,
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.symbolic(vim_item.kind, { with_text = true })
      local menu = source_mapping[entry.source.name]
      local maxwidth = 50

   --    if entry.source.name == 'cmp_tabnine' then
			-- 	if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
			-- 		menu = menu .. '[' .. entry.completion_item.data.detail .. ']'
			-- 	end
			-- end

      vim_item.menu = menu
      vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)

      return vim_item
    end
  },

  -- You should specify your *installed* sources.
  sources = {
    { name = 'nvim_lsp'                        },
    { name = 'npm'                             },
    { name = 'ultisnips'                       },
    -- { name = 'cmp_tabnine', max_item_count = 3 },
    { name = 'buffer', keyword_length = 5      },
    { name = 'path'                            },
    { name = 'calc'                            },
    { name = 'nvim_lua'                        },
  },

  experimental = {
    native_menu = false,
    ghost_text = true,
  }
}

-- tabnine:setup({
--         max_lines                = 1000;
--         max_num_results          = 3;
--         sort                     = true;
--         show_prediction_strength = true;
-- })
