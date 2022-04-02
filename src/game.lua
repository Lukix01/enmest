Game = {}
Box = {}
Stats = {
    investments = {}
}

function Game:load()
    Box.width = 700
    Box.height = 250
    Stats.investments.houses = 1
    Stats.investments.lcoins = 0
    Stats.investments.hotels = 0
    Stats.income = 20
end

function Game:draw()
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", love.graphics.getWidth() / 2 - Box.width / 2, love.graphics.getHeight() / 2 - Box.height / 2, Box.width, Box.height)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf("Your Investments", love.graphics.newFont(25), 0, 280, 1280, "center")
    love.graphics.printf("Income: " .. Stats.income .. "$/day", love.graphics.newFont(18), 0, 320, 1280, "center")
    love.graphics.setColor(0.5, 0.5, 0.5, 1)
    love.graphics.printf("Houses: " .. Stats.investments.houses .. " | " .. "Lcoins: " .. Stats.investments.lcoins .. " | " .. "Hotels: " .. Stats.investments.hotels, love.graphics.newFont(18), 0, 350, 1280, "center")
    love.graphics.setColor(1, 1, 1, 1)
end