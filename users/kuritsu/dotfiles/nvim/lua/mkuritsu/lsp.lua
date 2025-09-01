require("lazydev").setup {}

local function set_lsp_formatter(lsp, command)
  vim.lsp.config(lsp, {
    settings = {
      [lsp] = {
        formatting = {
          command = command
        }
      }
    }
  })
end

set_lsp_formatter("nixd", { "alejandra", "--quiet" })

vim.lsp.enable({
  "lua_ls", "ts_ls", "clangd", "pyright", "qmlls", "rust_analyzer", "jdtls", "marksman", "html", "cssls", "astro",
  "nixd", "cmake"
})

-- auto format on save
local no_format_list = { "cmake", "marksman" }

local function should_format(client)
  for _, lsp in ipairs(no_format_list) do
    if client.name == lsp then
      return false
    end
  end
  return true
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting')
        and should_format(client) then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end
})
