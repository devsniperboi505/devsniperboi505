-- conf.lua
t1 = require("config/loveconfig")
function love.conf(t)
	t1.draw(t)
end