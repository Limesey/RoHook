local classes = script.Parent.Classes
local RichEmbedClass = require(classes.RichEmbed)

local embed = RichEmbedClass.new("Hi", "Bunny")
local field = embed:addField("Test field", "its value")