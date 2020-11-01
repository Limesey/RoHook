--    Norbunny
--    November 1, 2020

local httpService = game:GetService("HttpService")

local RoHook = {}
RoHook.__index = RoHook

function RoHook.create(url, username, avatar)
    local hook = {}

    setmetatable(hook, RoHook)

    hook.avatarUrl = avatar or ""
    hook.username = username or ""
    hook.url = url

    return hook
end

function RoHook:setUsername()
    --
end

function RoHook:setAvatar(url)
end

function RoHook.send(data)
    local request = nil

    if data.ClassName == "RichEmbed" then
        print("RichEmbed")

    elseif data.ClassName == "Message" then
        print("Message")
    end
end

return RoHook