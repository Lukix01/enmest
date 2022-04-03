require("src/utils/timer")
require("src/states/game/ui/box")

Game = {
    nextInvestment = {
        name = "house",
        price = 50
    }
}

Stats = {
    investments = {
        houses = 1,
        lcoins = 0,
        hotels = 0
    },
    money = 100,
    income = 50
}

function buyNewInvestment()
    if Stats.money >= Game.nextInvestment.price then 
        if Game.nextInvestment.name == "house" then
            Stats.investments.houses = Stats.investments.houses + 1
        elseif Game.nextInvestment.name == "lcoin" then
            Stats.investments.lcoins = Stats.investments.lcoins + 1
        elseif Game.nextInvestment.name == "hotel" then
            Stats.investments.hotels = Stats.investments.hotels + 1
        end
        Stats.money = Stats.money - Game.nextInvestment.price
    else 
        print("not enough money")
    end
end

Box = {
    width = 600,
    height = 250,
    x = love.graphics.getWidth() / 2 - 600 / 2,
    y = love.graphics.getHeight() / 2 - 250 / 2,
    margin = 10,
    buttons = {
        { text = "Buy a new " .. Game.nextInvestment.name, fn = buyNewInvestment, x = love.graphics.getWidth() / 2 - 600 / 2, down = false, pressed = false },
        { text = "Pay bills", fn = nil, x = love.graphics.getWidth() / 2 - 600 / 2  + 600 / 3, down = false, pressed = false },
        { text = "Go to work", fn = nil, x = love.graphics.getWidth() / 2 - 600 / 2  + 600 / 3 * 2, down = false, pressed = false }
    }
}


function Game:load()
    Stats.income = 20
    GameBox:load()
end

function Income()
    Stats.money = Stats.money + Stats.income
end

function Game:update(dt)
    Timer:start(dt, 10, Income)
end

function Game:draw()
    GameBox:draw()
end