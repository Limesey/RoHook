-- Script type: Script
-- Writen by github.com/Limesey, @Norbunny on Roblox.


local discord = require(script.Parent.Discord)

local message = discord.newMessage()
e = message.addEmbed("Title", "Description")
e.addField("Name", "Value")
e.setAuthor("Norbunny","https://www.roblox.com/headshot-thumbnail/image?userId=76860346&width=420&height=420&format=png", "https://www.roblox.com/headshot-thumbnail/image?userId=76860346&width=420&height=420&format=png")
e.setThumbnail("https://www.roblox.com/headshot-thumbnail/image?userId=76860346&width=420&height=420&format=png")
e.setImage("https://www.roblox.com/headshot-thumbnail/image?userId=76860346&width=420&height=420&format=png")
e.setTimestamp()
e.setFooter("Developed by Norbunny", "https://www.roblox.com/headshot-thumbnail/image?userId=76860346&width=420&height=420&format=png")
e.setColor(Color3.new(0, 255, 0))

local success, err = discord:send(message)

if(not success) then
	warn(err)
end
