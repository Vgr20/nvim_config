require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls" , "pyright",  "ruff" },

})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', '<leader>gk', vim.lsp.buf.hover, {})
end

require("lspconfig").lua_ls.setup {
  on_attach = on_attach
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- local torchPath = "/home/user/miniconda3/envs/torch/bin/python"

function set_python_env(env_name)
  local env_paths = {
    torch = "/home/vishagar/miniconda3/envs/torch/bin/python",
    asp = "/home/vishagar/miniconda3/envs/asp/bin/python",
  }
  local python_path = env_paths[env_name]

  if python_path then
    -- Re-apply the settings with the correct environment's pythonPath
    require("lspconfig").pyright.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "python" },
      settings = {
        python = {
          pythonPath = python_path,  -- Change pythonPath based on the selected environment
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = "workspace",
          },
        },
      },
    })
  else
    print("Invalid environment name!")
  end
end

-- Optionally, you can create custom commands to switch environments:
vim.cmd([[command! UseTorchEnv lua set_python_env("torch")]])
vim.cmd([[command! UseAspEnv lua set_python_env("asp")]])

-- require("lspconfig").pyright.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "python" },
--   settings = {
--     python = {
--       pythonPath = torchPath,
--       analysis = {
--         autoSearchPaths = true,
--         useLibraryCodeForTypes = true,
--         diagnosticMode = "workspace",
--       },
--     },
--   },
-- }

