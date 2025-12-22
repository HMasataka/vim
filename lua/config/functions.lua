-- Custom functions

-- Hi command
vim.api.nvim_create_user_command("Hi", function(opts)
    print("Hi " .. opts.args)
end, { nargs = 1 })

-- Get Git root directory
local function ensure_git_root()
    local cmd = "git rev-parse --show-superproject-working-tree --show-toplevel 2>/dev/null | head -1"
    local handle = io.popen(cmd)
    if handle then
        local result = handle:read("*a")
        handle:close()
        local root = vim.fn.expand(vim.trim(result))
        if vim.fn.isdirectory(root) == 1 then
            return root
        end
    end
    return ""
end

-- Copy current file path to clipboard
vim.api.nvim_create_user_command("CPwd", function()
    local fullpath = vim.fn.expand("%:p")
    local git_root = ensure_git_root()

    if git_root ~= "" then
        local relative_path = fullpath:gsub("^" .. vim.pesc(git_root) .. "/", "")
        vim.fn.setreg("*", relative_path)
    else
        vim.fn.setreg("*", fullpath)
    end

    print("Copied: " .. vim.fn.getreg("*"))
end, { nargs = 0 })
