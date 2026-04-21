-- Utilidades Git para Telescope (evitar E5108 cuando cwd no es un repo)
local M = {}

function M.cwd_is_git_repo()
  vim.fn.system({ "git", "rev-parse", "--git-dir" })
  return vim.v.shell_error == 0
end

--- Telescope: git_files si hay repo; si no, find_files + aviso.
function M.telescope_git_files_or_find_files()
  local builtin = require("telescope.builtin")
  if M.cwd_is_git_repo() then
    builtin.git_files()
  else
    vim.notify(
      "No hay repositorio Git en el directorio actual; se listan archivos con find_files.",
      vim.log.levels.INFO,
      { title = "Telescope" }
    )
    builtin.find_files()
  end
end

return M
