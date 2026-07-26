--[[

    hi you can use this for ur script if u want

]]

local Api = {}

function Api:GetInstance(ins, limit)
    local Request = 0

    repeat
        task.wait()
        Request += 1
    until ins or (limit and Request >= 1000)

    if limit and Request >= 1000 then
        return "error"
    end

    return ins
end

function Api:GetFile(link, ...)
    local args = {...}
    local S, R = pcall(function()
        return game:HttpGet(link)
    end)

    if not S then
        return args[1] and "Failed"
    end

    if args[2] then
        writefile(args[2], R)
        return readfile(args[2])
    end

    return R
end

return Api
