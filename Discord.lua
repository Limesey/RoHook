local httpService = game:GetService("HttpService")

local function getDate()
	local date = os.date("!*t")
	
	local str = string.format("%s-%s-%sT%s:%s:%s.000Z", date.year, date.month, date.day, date.hour, date.min, date.sec)
	
	return str
end

local function rgbToDec(rgb)
	local dec = rgb.B * 65536 + rgb.G * 256 + rgb.R
	
	return dec
end


local module = {}

-- Your webhook's URL
module.webhookUrl = nil

function module.newMessage(message)
	message = message
	
	local content = {
		["content"] = message,
		["embeds"] = {}
	}
	
	function content.addEmbed(title, description)
		local embed = {
			["title"] = title,
			["description"] = description,
			["color"] = 0,
			["fields"] = {},
			["thumbnail"] = {
				["url" ]= ""
			},
			["image"] = {
				["url"] = ""
			},
			["author"] = {
				["name"] = "",
				["url"] = "",
				["icon_url"] = ""
			},
			["footer"] = {
				["text"] = "",
				["icon_url"] = ""
			},
			["timestamp"] = "" --"YYYY-MM-DDTHH:MM:SS.MSSZ"
		}
		
		table.insert(content.embeds, embed)
		
		function embed.setColor(rgb)
			embed.color = rgbToDec(rgb)
		end
		
		function embed.addField(name, value, inline)
			if(not name or not value) then error("Name and value can not be nil") end
			inline = inline or false
			
			local field = {
				["name"] = name,
				["value"] = value,
				["inline"] = inline
			}
			
			table.insert(embed.fields, field)
			return field
		end
		
		function embed.setAuthor(name, url, icon_url)
			if(not name and icon_url) then error("Name can not be nil") end
			embed.author.name = name
			embed.author.url = url
			embed.author.icon_url = icon_url
		end
		
		function embed.setThumbnail(url)
			if(not url) then error("URL can not be nil") end
			
			embed.thumbnail.url = url
		end
		
		function embed.setImage(url)
			if(not url) then error("URL can not be nil") end
			
			embed.image.url = url
		end
		
		function embed.setFooter(text, url)
			if(not text) then error("Text can not be nil!") end
			
			embed.footer.text = text
			embed.footer.icon_url = url
		end
		
		function embed.setTimestamp()
			embed.timestamp = getDate()
		end
		
		return embed
	end
	
	return content
end

function module:send(content)
	
	content = httpService:JSONEncode(content)
	
	local success, data = pcall(function()
		return httpService:PostAsync(module.webhookUrl, content)
	end)
	
	return success, data
end

return module
