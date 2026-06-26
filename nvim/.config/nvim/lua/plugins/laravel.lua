return {
	"adalessa/laravel.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-neotest/nvim-nio",
	},
	ft = { "php", "blade" },
	event = {
		"BufEnter composer.json",
	},
	keys = {
		{
			"<leader>ll",
			function()
				require("laravel").pickers.laravel()
			end,
			desc = "Laravel: Open Laravel Picker",
		},
		{
			"<c-g>",
			function()
				require("laravel").commands.run("view:finder")
			end,
			desc = "Laravel: Open View Finder",
		},
		{
			"<leader>la",
			function()
				require("laravel").pickers.artisan()
			end,
			desc = "Laravel: Open Artisan Picker",
		},
		{
			"<leader>lt",
			function()
				require("laravel").commands.run("actions")
			end,
			desc = "Laravel: Open Actions Picker",
		},
		{
			"<leader>lr",
			function()
				require("laravel").pickers.routes()
			end,
			desc = "Laravel: Open Routes Picker",
		},
		{
			"<leader>lh",
			function()
				require("laravel").run("artisan docs")
			end,
			desc = "Laravel: Open Documentation",
		},
		{
			"<leader>lm",
			function()
				require("laravel").pickers.make()
			end,
			desc = "Laravel: Open Make Picker",
		},
		{
			"<leader>lc",
			function()
				require("laravel").pickers.commands()
			end,
			desc = "Laravel: Open Commands Picker",
		},
		{
			"<leader>lo",
			function()
				require("laravel").pickers.resources()
			end,
			desc = "Laravel: Open Resources Picker",
		},
		{
			"<leader>lp",
			function()
				require("laravel").commands.run("command_center")
			end,
			desc = "Laravel: Open Command Center",
		},
		{
			"<leader>lu",
			function()
				require("laravel").commands.run("hub")
			end,
			desc = "Laravel Artisan hub",
		},
		{
			"gf",
			function()
				local ok, res = pcall(function()
					if require("laravel").app("gf").cursorOnResource() then
						return "<cmd>lua Laravel.commands.run('gf')<cr>"
					end
				end)
				if not ok or not res then
					return "gf"
				end
				return res
			end,
			expr = true,
			noremap = true,
		},
	},
	opts = {
		environments = {
			default = "docker-compose",
			definitions = {
				{
					name = "docker-compose",
					map = {
						php = { "docker", "compose", "exec", "-T", "php", "php" },
						composer = { "docker", "compose", "exec", "-T", "php", "composer" },
						npm = { "docker", "compose", "exec", "-T", "php", "npm" },
						yarn = { "docker", "compose", "exec", "-T", "php", "yarn" },
					},
				},
			},
		},
		features = {
			pickers = {
				provider = "snacks",
			},
		},
		extensions = {
			override = { enable = false },
		},
	},
}
