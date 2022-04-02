Button = {}

function Button:load()
    self.width = 100
    self.height = 40
    self.x = love.graphics.getWidth() / 2 - (self.width / 2)
    self.y = love.graphics.getHeight() / 2 - (self.height / 2)
end

function Button:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end