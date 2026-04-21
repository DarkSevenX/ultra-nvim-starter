--[[
  Ultra Nvim — distribución Neovim inspirada en LazyVim, NvChad, AstroNvim,
  LunarVim y kickstart: lazy.nvim, Mason, LSP nativo, Telescope, árbol de archivos,
  Git, formateo con conform, snippets, Flash, surround, textobjects Treesitter,
  Diffview, AutoSession, DAP y UI moderna.

  Lenguajes: JS/TS, JSON, Python, Bash, Markdown, C/C++, C#, Go, HCL/Terraform, Java, Julia, Lua, PowerShell, QML, Ruby, Rust, Scala, Swift, etc.

  Requisitos recomendados: Neovim ≥ 0.10, Git, herramientas de build en Unix (Treesitter, LuaSnip).
]]

require("config.keymaps")
require("config.core")
require("config.lazy")

-- TSX / JSX
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.tsx",
  callback = function()
    vim.bo.filetype = "typescriptreact"
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.jsx",
  callback = function()
    vim.bo.filetype = "javascriptreact"
  end,
})
