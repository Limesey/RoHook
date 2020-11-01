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

function RichEmbed:setColor()
end

function RichEmbed:setFooter(text, iconUrl)
    -- footer.text is limited to 2048 characters
end

function RichEmbed:setImage()
end

function RichEmbed:setThumbnail()
end

function RichEmbed:setAuthor(name, url, iconUrl)
    -- author.name is limited to 256 characters
    if name then
        assert(string.len(name) <= 256, "Name cannot be longer than 256 characters.")
    end

    local author = self.author or {
        name = name,
        url = url,
        icon_url = iconUrl
    }

    self.author = author
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