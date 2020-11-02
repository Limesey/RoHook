--    Norbunny
--    November 1, 2020

--[[
    Message.new(content: string) - Creates a new message
    Message.addEmbed(embed: RichEmbed) - Attaches a RichEmbed to the message
]]

local Message = {}
Message.ClassName = "Message"
Message.__index = Message

function Message.new(content)
    assert(content, "Content cannot be nil.")
    assert(string.len(content), "Content must not exceed 2000 characters.")

    local self = {
        content = content
    }

    setmetatable(self, Message)

    return self
end

function Message:addEmbed(embed)
    assert(embed, "Embed cannot be nil.")
    assert(embed.ClassName =="RichEmbed", "embed must be of type RichEmbed.")

    local embeds = self.embeds or {}
    assert(#embeds <= 10, "Webhook messages can only contain 10 RichEmbeds.")

    table.insert(embeds, #embeds + 1, embed)
    self.embeds = embeds

    return embed
end

return Message