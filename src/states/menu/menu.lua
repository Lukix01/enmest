require("src/utils/timer")
require("src/events/key")

Menu = {}

function Menu:load()
    Menu.width = 350
    Menu.height = 450
end

function Menu:update(dt)
    
end

function Menu:draw()
    love.graphics.printf("ENMEST", love.graphics.newFont(30), 0, 300, 1280, "center")
    love.graphics.setColor(0.5, 0.5, 0.5, 1)
    love.graphics.printf("Press space to start", love.graphics.newFont(25), 0, 350, 1280, "center")
    love.graphics.setColor(1, 1, 1, 1)
    Key:down("space", function() WindowManager.state = "game" end)
end