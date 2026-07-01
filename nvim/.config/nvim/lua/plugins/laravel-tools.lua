vim.filetype.add({
	pattern = {
		[".*%.blade%.php"] = "blade",
	},
})

local function root_file(bufnr, names)
	local path = vim.api.nvim_buf_get_name(bufnr)
	local found = vim.fs.find(names, {
		path = vim.fs.dirname(path),
		upward = true,
		type = "file",
	})[1]

	return found and vim.fs.dirname(found) or nil
end

local function executable(path)
	return vim.fn.executable(path) == 1
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = { "blade" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				intelephense = {
					settings = {
						intelephense = {
							files = {
								maxSize = 2000000,
							},
						},
					},
				},
				laravel_ls = {},
				emmet_language_server = {
					filetypes = { "blade" },
					init_options = {
						includeLanguages = {
							blade = "html",
						},
					},
				},
				tailwindcss = {
					settings = {
						tailwindCSS = {
							includeLanguages = {
								blade = "html",
							},
						},
					},
				},
			},
		},
	},
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"blade-formatter",
				"emmet-language-server",
				"laravel-ls",
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = function(_, opts)
			opts.formatters_by_ft = opts.formatters_by_ft or {}
			opts.formatters = opts.formatters or {}

			opts.formatters_by_ft.php = { "laravel_pint" }
			opts.formatters_by_ft.blade = { "blade-formatter" }

			opts.formatters.laravel_pint = function(bufnr)
				local root = root_file(bufnr, { "composer.json", "pint.json", ".pint.json" }) or vim.fn.getcwd()
				local dpint = root .. "/dpint"
				local pint = root .. "/vendor/bin/pint"

				if executable(dpint) then
					return {
						command = dpint,
						args = { "$FILENAME" },
						cwd = function()
							return root
						end,
						stdin = false,
					}
				end

				if executable(pint) then
					return {
						command = pint,
						args = { "$FILENAME" },
						cwd = function()
							return root
						end,
						stdin = false,
					}
				end

				return {
					command = "docker",
					args = { "compose", "exec", "-T", "php", "vendor/bin/pint", "$FILENAME" },
					cwd = function()
						return root
					end,
					stdin = false,
				}
			end
		end,
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			{ "saghen/blink.compat", opts = {}, version = "*" },
		},
		opts = {
			sources = {
				compat = { "laravel" },
				providers = {
					laravel = {
						name = "laravel",
						module = "blink.compat.source",
						score_offset = 95,
					},
				},
			},
		},
	},
}
