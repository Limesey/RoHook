--    Norbunny
--    November 1, 2020

local httpService = game:GetService("HttpService")

local RoHook = {}
RoHook.__index = RoHook

function RoHook.new(url, username, avatar)
    assert(url, "URL cannot be nil.")
    
    local self = {
        url = url,
        username = username,
        avatarUrl = avatar
    }

    setmetatable(self, RoHook)

    return self
end

function RoHook:setUsername(username)
    self.username = username
end

function RoHook:setAvatar(url)
    self.avatarUrl = url
end

function RoHook:send(data)
    local request = {
        username = self.username,
        avatar_url = self.avatarUrl
    }

    if data.ClassName == "RichEmbed" then
        request.embeds = {data}

    elseif data.ClassName == "Message" then
        print("Sending Message")
    end

    local success, res = pcall(function()
        local response = httpService:RequestAsync({
            Url = self.url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json" 
            },
    
            Body = httpService:JSONEncode(request)
        })

        return response
    end)

    if not success then
        error(string.format("POST request failed: %s", res))
    else
        assert(res.Success, string.format("Server replied with %s - %s", res.StatusCode, res.StatusMessage))
    end
end

return RoHook