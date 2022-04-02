require("src/states/menu/menu")
require("src/states/game/game")

WindowManager = {}

function WindowManager:load()
    Menu:load()
    Game:load()
end

function WindowManager:update(dt)
    Menu:update(dt)
    Game:update(dt)
end

function WindowManager:draw()
    self.state = "game"
    if self.state == "menu" then
        Menu:draw()
    elseif self.state == "game" then
        Game:draw()
    end
end