require("src/ui/menu")

WindowManager = {}

function WindowManager:load()
    Menu:load()
end

function WindowManager:draw()
    self.state = "menu"
    if self.state == "menu" then
        Menu:draw()
    end
end