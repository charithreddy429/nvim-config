return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local status, configs = pcall(require, "nvim-treesitter.configs")
    if not status then
      return
    end

    configs.setup({
        ensure_installed = { "markdown", "markdown_inline", "latex", "lua", "regex" ,"c" , "python"},
        auto_install = true,
        highlight = {
            enabled = true,
            additional_vim_regex_highlighting = false,
        },
    })
end,
}
