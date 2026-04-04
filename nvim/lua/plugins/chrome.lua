return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"rebelot/heirline.nvim",
		enabled = false,
		config = function()
			local heirline = require("heirline")
			local conditions = require("heirline.conditions")

			-- Collect buffers visible in the current window
			local WindowTabs = {
				init = function(self)
					-- 1) tab-scoped list (order never changes)
					self.tab_bufs = vim.tbl_filter(function(b)
						return vim.api.nvim_buf_is_valid(b)
							and vim.bo[b].buflisted
							and vim.api.nvim_buf_get_name(b) ~= ""
					end, vim.fn.tabpagebuflist())

					-- 2) current window buffer
					self.win_buf = vim.api.nvim_win_get_buf(0)
				end,

				-- Build VSCode-style tabs
				provider = function(self)
					local segs = {}
					for _, b in ipairs(self.tab_bufs) do
						local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(b), ":t")
						if name == "" then
							name = "[No Name]"
						end

						-- active vs inactive highlight
						local hl = (b == self.win_buf) and "%#WinbarActive#" or "%#WinbarInactive#"
						table.insert(segs, string.format("%s %s %%*", hl, name))
					end
					return table.concat(segs, "  ")
				end,
			}

			local WinBar = {
				fallthrough = false,
				{
					condition = function()
						return vim.bo.filetype ~= ""
							and vim.bo.filetype ~= "neo-tree"
							and vim.bo.filetype ~= "toggleterm"
					end,
					WindowTabs,
				},
			}

			heirline.setup({
				winbar = WinBar,
				opts = {
					disable_winbar_cb = function(args)
						return conditions.buffer_matches({
							buftype = { "nofile", "prompt", "help", "quickfix" },
							filetype = { "NvimTree", "neo-tree", "alpha", "dashboard" },
						}, args.buf)
					end,
				},
			})

			-- highlight groups
			vim.api.nvim_set_hl(0, "WinbarActive", { bold = true, fg = "#7aa2f7" })
			vim.api.nvim_set_hl(0, "WinbarInactive", { fg = "#565f89" })
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		enabled = false,
		opts = {
			options = {
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
		},
		config = function(_, opts)
			local function wintabs_buffers(info)
				local utils = require("utils")
				local l = utils.wintab_line(vim.fn.win_getid())
				return l
			end
			local c = {
				wintabs_buffers,
			}
			require("lualine").setup(opts)
		end,
	},
	{
		"nanozuki/tabby.nvim",
		config = function()
			vim.o.showtabline = 2
			local theme = {
				fill = "TabLineFill",
				head = "TabLine",
				current_tab = "TabLineSel",
				tab = "TabLine",
				win = "TabLine",
				tail = "TabLine",
			}
			require("tabby").setup({
				line = function(line)
					return {
						{
							{ "  ", hl = theme.head },
							line.sep("", theme.head, theme.fill),
						},
						line.tabs().foreach(function(tab)
							local hl = tab.is_current() and theme.current_tab or theme.tab
							return {
								line.sep("", hl, theme.fill),
								tab.is_current() and "" or "󰆣",
								tab.number(),
								tab.name(),
								tab.close_btn(""),
								line.sep("", hl, theme.fill),
								hl = hl,
								margin = " ",
							}
						end),
						line.spacer(),
						line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
							return {
								line.sep("", theme.win, theme.fill),
								win.is_current() and "" or "",
								win.buf_name(),
								line.sep("", theme.win, theme.fill),
								hl = theme.win,
								margin = " ",
							}
						end),
						{
							line.sep("", theme.tail, theme.fill),
							{ "  ", hl = theme.tail },
						},
						hl = theme.fill,
					}
				end,
			})
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"echasnovski/mini.icons",
	},
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		opts = {
			left = {
				{
					ft = "snacks_layout_box",
					title = "Explorer",
					filter = function(_, win)
						return vim.api.nvim_win_get_config(win).relative == ""
					end,
					pinned = true,
				},
			},
			bottom = {},
			right = {
				{
					title = "Claude",
					ft = "snacks_terminal",
					size = { width = 50 },
					open = "ClaudeCode",
				},
				{
					title = "Code Companion",
					ft = "codecompanion",
					size = { width = 50 },
					open = "CodeCompanionChat",
				},
			},
			top = {},
			middle = {},
			wo = {
				winbar = true,
				winfixwidth = true,
				winfixheight = false,
				winhighlight = "WinBar:EdgyWinBar,Normal:EdgyNormal",
				spell = false,
				signcolumn = "no",
			},
			keys = {
				["<c-l>"] = function(win)
					win:resize("width", -2)
				end,
				["<c-h>"] = function(win)
					win:resize("width", 2)
				end,
			},
		},
		config = function(_, opts)
			vim.opt.showtabline = 2
			vim.opt.laststatus = 3
			vim.opt.splitkeep = "screen"
			require("edgy").setup(opts)
		end,
	},
}
