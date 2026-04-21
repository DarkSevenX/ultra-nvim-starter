-- Callback compartido para clientes LSP (Mason / nvim-metals / SourceKit manual).
local M = {}

function M.on_attach(_, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end
  map("n", "K", vim.lsp.buf.hover, "LSP: hover")
  map("n", "gd", vim.lsp.buf.definition, "LSP: ir a definición")
  map("n", "gD", vim.lsp.buf.declaration, "LSP: declaración")
  map("n", "gi", vim.lsp.buf.implementation, "LSP: implementaciones")
  map("n", "gr", vim.lsp.buf.references, "LSP: referencias")
  map("n", "<leader>cr", vim.lsp.buf.rename, "LSP: renombrar")
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP: acciones")
end

return M
