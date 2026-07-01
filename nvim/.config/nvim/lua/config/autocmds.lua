local web_indent_group = vim.api.nvim_create_augroup("web_indent", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = web_indent_group,
  pattern = {
    "php",
    "blade",
    "html",
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
    "css",
    "scss",
    "sass",
  },
  callback = function(event)
    local options = vim.bo[event.buf]

    options.shiftwidth = 4
    options.tabstop = 4
    options.softtabstop = 4
    options.expandtab = true

    if event.match == "php" then
      options.autoindent = true
      options.smartindent = false
      options.cindent = false
    end
  end,
})
