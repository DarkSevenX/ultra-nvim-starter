vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap

-- Generales
map.set("i", "jk", "<ESC>", { silent = true })
map.set("n", "<leader>nh", ":nohl<CR>", { silent = true, desc = "Quitar resaltado" })
map.set("n", "<C-s>", ":silent w<CR>", { silent = true, desc = "Guardar" })
map.set("n", "<leader>q", ":silent q<CR>", { silent = true, desc = "Cerrar" })

-- Ventanas
map.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertical" })
map.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontal" })
map.set("n", "<leader>se", "<C-w>=", { desc = "Equilibrar splits" })
map.set("n", "<leader>sc", ":close<Cr>", { desc = "Cerrar ventana" })

-- Pestañas nativas de Vim (:tab), no bufferline
map.set("n", "<leader>nt", ":tabnew<Cr>", { silent = true, desc = "Nueva pestaña vacía" })
map.set("n", "<leader>tc", ":tabclose<Cr>", { silent = true, desc = "Cerrar pestaña actual" })
map.set("n", "<leader>to", ":tabonly<Cr>", { silent = true, desc = "Cerrar otras pestañas" })
map.set("n", "<leader>tn", ":tabnext<Cr>", { silent = true, desc = "Siguiente pestaña" })
map.set("n", "<leader>tp", ":tabprevious<Cr>", { silent = true, desc = "Pestaña anterior" })
map.set("n", "<leader>t1", ":tabfirst<Cr>", { silent = true, desc = "Primera pestaña" })
map.set("n", "<leader>t0", ":tablast<Cr>", { silent = true, desc = "Última pestaña" })

-- NvimTree
map.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, desc = "Explorador archivos" })

-- Diagnósticos (LSP nativo, estilo kickstart)
map.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnóstico anterior" })
map.set("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnóstico siguiente" })
map.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Diagnóstico (flotante)" })

-- ToggleTerm (también definido en toggleterm.nvim)
map.set("n", "<leader>ñ", ":ToggleTerm 1<CR>", { silent = true, desc = "Terminal flotante" })
map.set("n", "<leader>;", ":ToggleTerm 1<CR>", { silent = true, desc = "Terminal flotante" })
map.set("n", "<leader>2", ":ToggleTerm 2 <CR>", { silent = true, desc = "Terminal 2" })

-- Kulala (sustituye rest.nvim / comando :Rest)
map.set("n", "<leader>rr", function()
  require("kulala").run()
end, { desc = "Kulala: ejecutar petición" })
map.set("n", "<leader>pp", function()
  require("kulala").open()
end, { desc = "Kulala: panel" })
map.set("n", "<leader>ll", function()
  require("kulala").inspect()
end, { desc = "Kulala: inspeccionar respuesta" })
