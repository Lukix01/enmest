require("src/utils/timer")

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
    if love.keyboard.isDown("space") then
        WindowManager.state = "game"
    end
end