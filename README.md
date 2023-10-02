# rust_nvim.config
Just regular neovim config for rust development which includes dap and rust_analyzer etc why ? cause i forgot.

**Note** : I use Astronvim as the base. 

## requirements
- Mason

```
codelldb
cpptools

```
- Local packagemanager like pacman 

```
codelldb
lldb
```
- Plugins 
```
nvim-dap
nvim-dap-project

```

## Files to be added

`~/.config/nvim/lua/user/plugins/dap-projects.lua`

```

return {
 {
   "ldelossa/nvim-dap-projects",
 },
}
```
`~/.config/nvim/lua/user/init.lua` and inside polish

```
require("nvim-dap-projects").search_project_config()
```


`.nvim-dap.lua`
```
local dap = require("dap")

dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode", -- adjust as needed
    name = "lldb",
}

dap.configurations.rust = {
    {
        name = "rust-debug",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.getcwd() .. "<path to compiled project executable>"
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
```

## Credit/Reference
[Article](https://romangeber.com/blog/tech/nvim_rust_debugger)

[Youtube](https://www.youtube.com/watch?v=gihHLsClHF0)

[Youtube](https://www.youtube.com/watch?v=lEMZnrC-ST4)
