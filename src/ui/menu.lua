require("src/ui/button")

Menu = {}

function Menu:load()
    self.width = 350
    self.height = 450
    Button:load()
end

function Menu:draw()
    Button:draw("Start")
    Button:draw("Exit")
end