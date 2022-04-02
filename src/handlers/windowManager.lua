require("src/ui/menu")
require("src/game")

WindowManager = {}

function WindowManager:load()
    Menu:load(self.state)
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