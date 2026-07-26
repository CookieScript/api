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
        for _, Value in next, args do
            if typeof(Value) == "boolean" and Value then
                return "Failed"
            end
        end
        return nil
    end

    return R
end

return Api
