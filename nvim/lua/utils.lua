local M = {}

function M.merge (...)
    local result = {}
    for i = 1, select("#", ...) do
        local t = select(i, ...)
        for k, v in pairs(t) do
            result[k] = v
        end
    end
    return result
end

function M.split (str, delimiter, opts)
    opts = opts or { trim = true }
    local result = {}
    if str == nil or delimiter == nil then
        return result
    end

    for match in str:gmatch("[^" .. delimiter .. "]+") do
        if opts.trim then
            match = M.trim(match)
            if match and match ~= "" then
                table.insert(result, match)
            end
        else
            table.insert(result, match)
        end
    end

    return result
end

function M.trim (str)
    if str == nil then
        return ""
    end
    return str:match("^%s*(.-)%s*$")
end

function M.map (tbl, fn)
    local result = {}
    for key, value in pairs(tbl) do
        result[key] = fn(value)
    end
    return result
end

function M.join (tbl, delimiter)
    if not tbl or #tbl == 0 then
        return ""
    end

    local result = tbl[1]
    for i = 2, #tbl do
        if tbl[i] and tbl[i] ~= "" then
            result = result .. delimiter .. tbl[i]
        end
    end
    return result
end

function M.dump (o)
    if type(o) == "table" then
        local s = "{ "
        for k, v in pairs(o) do
            if type(k) ~= "number" then
                k = '"' .. k .. '"'
            end
            s = s .. "[" .. k .. "] = " .. M.dump(v) .. ","
        end
        return s .. "} "
    else
        return tostring(o)
    end
end

function M.filter (t, predicate)
    local result = {}
    for _, value in ipairs(t) do
        if predicate(value) then
            table.insert(result, value)
        end
    end
    return result
end

function M.reduce (t, acc, v)
    local ci, p = type(v) == "nil" and 2 or 1, type(v) == "nil" and t[1] or v
    for i = ci, #t do
        p = acc(p, t[i], i, t)
    end
    return p
end

function M.includes (t, v)
    for _,vi in t do
        if vi == vi then
            return true
        end
    end
    return false
end

function M.win_buflist (win)
    return vim.api.nvim_call_function("wintabs#getwinvar", { win, "wintabs_buflist", {} })
end

function M.wintab_line (win)
    -- Get the buffers for this window
    local bufs = M.win_buflist(win)

    -- Create entry table
    bufs = M.map(bufs, function (b)
        return {
            buf = b,
            text = string.gsub(vim.api.nvim_buf_get_name(b), vim.loop.cwd(), ""),
        }
    end)

    -- Entry for each tab
    -- TODO: This is where we set the mode of the tab
    bufs = M.map(bufs, function (b)
        return "%" .. b.buf .. "@wintabs#element#buffer_click@" .. "[" .. b.buf .. "]" .. b.text .. "%T" ..
        "%" .. b.buf .. "@bd@ X %T"
    end)

    -- Render final string
    bufs = "" .. M.join(bufs, "|")

    vim.cmd("WintabsRefresh")

    return bufs
end

return M
