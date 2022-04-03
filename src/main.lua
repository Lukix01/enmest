require("src/handlers/windowManager")

love.graphics.setDefaultFilter("nearest", "nearest")


function love.load()
    grid = love.graphics.newImage("assets/grid.png")
    WindowManager:load()
end

function love.update(dt)
    WindowManager:update(dt)
end

function love.draw()
    love.graphics.draw(grid) 
    WindowManager:draw()
end