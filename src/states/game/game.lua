require("src/utils/timer")
require("src/states/game/ui/box")

Stats = {
    investments = {
        {name = "houses", amount = 1, income = 50},
        {name = "lcoins", amount = 0, income = 250},
        {name = "hotels", amount = 0, income = 700}
    },
    money = 100,
    bills = 20,
    income = 50
}

Game = {
    nextInvestment = {
        name = "house",
        inv = 1,
        price = 50
    }
}

function buyNewInvestment()
    if Stats.money >= Game.nextInvestment.price then 
        Stats.investments[Game.nextInvestment.inv].amount = Stats.investments[Game.nextInvestment.inv].amount + 1
        Stats.money = Stats.money - Game.nextInvestment.price
        Stats.income = Stats.income + Stats.investments[Game.nextInvestment.inv].income 
        Game.nextInvestment.price = Game.nextInvestment.price * 1.5
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
        { text = "[1] Buy a new " .. Game.nextInvestment.name, hover = Game.nextInvestment.price .. "$", fn = buyNewInvestment, x = love.graphics.getWidth() / 2 - 600 / 2 },
        { text = "[2] Pay bills", hover = "bills", fn = nil, x = love.graphics.getWidth() / 2 - 600 / 2  + 600 / 3, down = false },
        { text = "[3] Go to work", hover = "work", fn = nil, x = love.graphics.getWidth() / 2 - 600 / 2  + 600 / 3 * 2, down = false }
    }
}


function Game:load()
    GameBox:load()
end

function Income()
    Stats.money = Stats.money + Stats.income
end

function Bills()
    Stats.money = Stats.money - Stats.bills
end

function Game:update(dt)
    Timer:start(dt, { { timeLimit = 10, fn = Income}, { timeLimit = 30, fn = Bills}  })
end

function Game:draw()
    GameBox:draw()
end
