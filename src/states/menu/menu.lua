require("src/utils/timer")

Menu = {}

function Menu:load(state)
    self.width = 350
    self.height = 450
    if state then
        state = "game"
    end
end

function Menu:update(dt)
    
end

function Menu:draw()
    love.graphics.printf("ENMEST", love.graphics.newFont(30), 0, 300, 1280, "center")
    love.graphics.setColor(0.5, 0.5, 0.5, 1)
    love.graphics.printf("Press space to start", love.graphics.newFont(25), 0, 350, 1280, "center")
    love.graphics.setColor(1, 1, 1, 1)
    if love.keyboard.isDown("space") then
        if self.state then
            self.state = self.state + "game"
        end
    end
end