require("src/ui/button")

Menu = {}

function Menu:load()
    self.width = 200
    self.height = 400
    Button:load()
end

function Menu:draw()
    love.graphics.rectangle("fill", love.graphics.getWidth() / 2 - (self.width / 2), love.graphics.getHeight() / 2 - (self.height / 2), self.width, self.height)
    Button:draw()
end