require("colorizer").setup()
require("hop").setup()
require("symbols-outline").setup()

-- python provider
vim.g.python3_host_prog = "/usr/bin/python3"

-- Chrome provider
if vim.fn.has("macos") then
    vim.g.mkdp_path_to_chrome = "open -a Google\\ Chrome"
end
