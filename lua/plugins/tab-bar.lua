-- Barra superior: pestañas Vim (tabby) o lista de buffers (bufferline).
-- vim.g.ultra_tab_bar = "tabs" | "buffers" — ver lua/config/core.lua o init.lua antes de config.core
local function use_bufferline()
  return vim.g.ultra_tab_bar == "buffers"
end

local function use_tabs()
  return not use_bufferline()
end

local function nvim_tree_width()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local ok, buf = pcall(vim.api.nvim_win_get_buf, win)
    if ok and vim.bo[buf].filetype == "NvimTree" then
      return vim.api.nvim_win_get_width(win)
    end
  end
  return 0
end

-- No mostrar NvimTree en la lista de ventanas del preset (evita "NvimTree_1" al final de la tabline).
local function tabby_patch_ignore_nvim_tree_wins()
  local lines_mod = require("tabby.feature.lines")
  if lines_mod._ultra_skip_nvim_tree then
    return
  end
  lines_mod._ultra_skip_nvim_tree = true
  local orig_get_line = lines_mod.get_line
  function lines_mod.get_line(opt)
    local line = orig_get_line(opt)
    local orig_wins_in_tab = line.wins_in_tab
    line.wins_in_tab = function(tabid)
      return orig_wins_in_tab(tabid).filter(function(win)
        local bufid = vim.api.nvim_win_get_buf(win.id)
        return vim.bo[bufid].filetype ~= "NvimTree"
      end)
    end
    return line
  end
end

local function tabby_patch_nvim_tree_pad()
  local tbl = require("tabby.tabline")
  local old_fn = tbl.cfg.fn
  if not old_fn then
    return
  end
  tbl.cfg.fn = function(line)
    local el = old_fn(line)
    local pad = nvim_tree_width()
    if pad > 0 and type(el) == "table" then
      local fill = (tbl.cfg.opt and tbl.cfg.opt.theme and tbl.cfg.opt.theme.fill) or "TabLineFill"
      table.insert(el, 1, { string.rep(" ", pad), hl = fill })
    end
    return el
  end

  vim.api.nvim_create_autocmd({ "WinEnter", "WinClosed", "VimResized", "BufWinEnter" }, {
    callback = function()
      vim.schedule(function()
        pcall(vim.cmd, "redrawtabline")
      end)
    end,
  })
end

local function tabby_config()
  tabby_patch_ignore_nvim_tree_wins()

  -- No pongas name_fallback = tostring(tabid): duplica el dígito junto a tab.number() (se ve "1 1 x 2 2 x").
  -- Por defecto tabby añade "[N+]" si hay varias ventanas en la pestaña; aquí solo el nombre del buffer activo.
  local option = {
    nerdfont = true,
    lualine_theme = "tokyodark",
    buf_name = {
      mode = "unique",
    },
    tab_name = {
      name_fallback = function(tabid)
        local api = require("tabby.module.api")
        local win_name = require("tabby.feature.win_name")
        local wins = api.get_tab_wins(tabid)
        local cur_win = api.get_tab_current_win(tabid)
        local pick_win = cur_win
        if vim.bo[vim.api.nvim_win_get_buf(cur_win)].filetype == "NvimTree" then
          for _, w in ipairs(wins) do
            if vim.bo[vim.api.nvim_win_get_buf(w)].filetype ~= "NvimTree" then
              pick_win = w
              break
            end
          end
        end
        if api.is_float_win(pick_win) then
          return "[Floating]"
        end
        return win_name.get(pick_win)
      end,
    },
  }

  local ok = pcall(function()
    require("tabby").setup({
      preset = "active_wins_at_tail",
      option = option,
    })
  end)

  if not ok then
    option.lualine_theme = nil
    option.theme = {
      fill = "TabLineFill",
      head = "TabLine",
      current_tab = "TabLineSel",
      tab = "TabLine",
      win = "TabLine",
      tail = "TabLine",
    }
    require("tabby").setup({
      preset = "active_wins_at_tail",
      option = option,
    })
  end

  tabby_patch_nvim_tree_pad()
end

return {
  {
    "nanozuki/tabby.nvim",
    lazy = false,
    enabled = use_tabs,
    dependencies = {
      "nvim-lualine/lualine.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = tabby_config,
  },

  {
    "akinsho/bufferline.nvim",
    lazy = false,
    enabled = use_bufferline,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        custom_filter = function(bufnr)
          return vim.bo[bufnr].filetype ~= "NvimTree"
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "Explorador",
            highlight = "NvimTreeNormal",
            separator = true,
          },
        },
      },
    },
  },
}
