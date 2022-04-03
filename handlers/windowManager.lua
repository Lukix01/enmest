require("states/menu/menu")
require("states/game/game")

WindowManager = {
    state = "menu"
}

function WindowManager:load()
    Menu:load()
    Game:load()
end

function WindowManager:update(dt)
    Menu:update(dt)
    Game:update(dt)
end

function WindowManager:draw()
    if WindowManager.state == "menu" then
        Menu:draw()
    elseif WindowManager.state == "game" then
        Game:draw()
    end
end