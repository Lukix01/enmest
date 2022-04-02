require("src/handlers/windowManager")

function love.load()
    grid = love.graphics.newImage("assets/grid.png")
    WindowManager:load()
end

function love.draw()
    love.graphics.draw(grid) 
    WindowManager:draw()
end