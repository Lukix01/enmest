require("src/ui/menu")
require("src/game")

WindowManager = {}

function WindowManager:load()
    Menu:load()
    Game:load()
end

function WindowManager:draw()
    self.state = "game"
    if self.state == "menu" then
        Menu:draw()
    elseif self.state == "game" then
        Game:draw()
    end
end