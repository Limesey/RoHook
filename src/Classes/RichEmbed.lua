--    Norbunny
--    November 1, 2020

--[[
    RichEmbed.new(title: string, description: string) - Creates a new RichEmbed

    RichEmbed:setTimestamp() - Sets the RichEmbed's timestamp

    RichEmbed:setColor(color: RGB) - Sets the RichEmbed's color

    RichEmbed:setFooter(text: string, iconUrl: string) - Sets the RichEmbed footer's text & icon

    RichEmbed:setImage(url: string, height: int, width: int) - Sets the RichEmbed's image & its resolution

    RichEmbed:setThumbnail(url: string, height: int, width: int) - Sets the RichEmbed's thumbnail & its resolution
    
    RichEmbed:setAuthor(name: string, url: string, iconUrl: string) - Sets the RichEmbed's author name, url & icon

    RichEmbed:addField(name: string, value: string, inline: boolean) - Adds a field to the RichEmbed with the arguments passed
]]

local RichEmbed = {}
RichEmbed.ClassName = "RichEmbed"
RichEmbed.__index = RichEmbed

function RichEmbed.new(title, description)
    if title then
        assert(string.len(title) <= 256, "Title cannot be longer than 256 characters.")
    end

    if description then
        assert(string.len(description) <= 2048, "Description cannot be longer than 2048 characters.")
    end

    local self = {
        title = title,
        description = description
    }

    setmetatable(self, RichEmbed)

    return self
end

function RichEmbed:setTimestamp()
    self.timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
end

function RichEmbed:setColor(rgb)
    assert(rgb, "Color cannot be nil")
    self.color = rgb.R * 65536 + rgb.G * 256 + rgb.B
end

function RichEmbed:setFooter(text, iconUrl)
    assert(text, "Text cannot be nil.")
    assert(string.len(text) <= 2048, "Text cannot be longer than 2048 characters")

    self.footer = {
        text = text,
        icon_url = iconUrl
    }
end

function RichEmbed:setImage(url, height, width)
    self.image = {
        url = url,
        height = height,
        width = width
    }
end

function RichEmbed:setThumbnail(url, height, width)
    self.thumbnail = {
        url = url,
        height = height,
        width = width
    }
end

function RichEmbed:setAuthor(name, url, iconUrl)
    if name then
        assert(string.len(name) <= 256, "Name cannot be longer than 256 characters.")
    end

    self.author = {
        name = name,
        url = url,
        icon_url = iconUrl
    }
end

function RichEmbed:addField(name, value, inline)
    assert(name and value, "Name and Value cannot be nil.")
    assert(string.len(name) <= 256, "Name cannot be longer than 256 characters.")
    assert(string.len(value) <= 1024, "Value cannot be longer than 1024 characters.")

    local fields = self.fields or {}
    assert(#fields + 1 <= 25, "RichEmbed cannot contain more than 25 fields.")
    
    local field = {
        name = name,
        value = value,
        inline = inline
    }

    table.insert(fields, #fields + 1, field)
    self.fields = fields

    return field
end

return RichEmbed