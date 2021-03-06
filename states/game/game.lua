require("utils/timer")
require("states/game/ui/box")
require("states/game/ui/alert")
require("states/game/ui/work")
require("modules/audio")

Stats = {
    investments = {
        { name = "houses", amount = 1, income = 50 },
        { name = "lcoins", amount = 0, income = 250 },
        { name = "hotels", amount = 0, income = 700 }
    },
    money = 100,
    bills = 20,
    waitingBills = 0,
    billsTime = 4,
    income = 50
}

Game = {
    alert = { state = false, text = nil },
    working = false,
    nextInvestment = {
        name = "house",
        inv = 1,
        price = 300,
        bills = 20,
    }
}

function buyNewInvestment()
    if Stats.money >= Game.nextInvestment.price then 
        Stats.investments[Game.nextInvestment.inv].amount = Stats.investments[Game.nextInvestment.inv].amount + 1
        Stats.money = Stats.money - Game.nextInvestment.price
        Stats.income = Stats.income + Stats.investments[Game.nextInvestment.inv].income 
        Stats.bills = Stats.bills + Game.nextInvestment.bills 
        Audio:play("assets/sounds/success.wav")
        if Stats.investments[1].amount == 10 and Stats.investments[2].amount == 0 then
            Game.nextInvestment.name = "lcoin"
            Game.nextInvestment.inv = 2
            Game.nextInvestment.price = 2000
            Game.nextInvestment.bills = 70
        elseif Stats.investments[2].amount == 10 then
            Game.nextInvestment.name = "hotel"
            Game.nextInvestment.inv = 3
            Game.nextInvestment.price = 20000
            Game.nextInvestment.bills = 200
        end
    else
        Audio:play("assets/sounds/fail.wav")
    end
end

function PayBills()
    if Stats.money >= Stats.waitingBills and Stats.waitingBills >= 0 then
        Stats.money = Stats.money - Stats.waitingBills
        Stats.waitingBills = 0
        Stats.billsTime = 4
    end
end

function Working()
    if not Game.working and Work.countdown == 0 then
        Game.working = true
    else
        Game.working = false
    end
end

Box = {
    width = 650,
    height = 250,
    x = love.graphics.getWidth() / 2 - 650 / 2,
    y = love.graphics.getHeight() / 2 - 250 / 2,
    margin = 10,
    buttons = {
        { text = "[1] Buy a new investment", secondText = true, fn = buyNewInvestment, x = love.graphics.getWidth() / 2 - 650 / 2 },
        { text = "[2] Pay bills", secondText = true, fn = PayBills, x = love.graphics.getWidth() / 2 - 650 / 2  + 650 / 3, down = false },
        { text = "[3] Go to work", fn = Working, x = love.graphics.getWidth() / 2 - 650 / 2  + 650 / 3 * 2, down = false }
    }
}


function Game:load()
    GameBox:load()
    Alert:load()
    Work:load()
end

function Income()
    Stats.money = Stats.money + Stats.income
end


function Game:update(dt)
    Work:update(dt)
    function Bills()
        if Stats.billsTime == 0 then
            love.event.quit()
        else
            Stats.waitingBills = Stats.waitingBills + Stats.bills
            Stats.billsTime = Stats.billsTime - 1
            Game.alert.state = true
            Audio:play("assets/sounds/alert.wav")
            Game.alert.text = "New bills to pay ("  .. Stats.waitingBills .. "$) " .. "You have " .. Stats.billsTime ..  " weeks to do that, otherwise you lose the game."
        end
    end
    if Game.alert.state then
        Alert:update(dt, Game.alert.text)
    end 

    Timer:start(dt, { { timeLimit = 10, fn = Income}, { timeLimit = 25, fn = Bills }  })
end

function Game:draw()
    Alert:draw()
    GameBox:draw()
    if Game.working then
        Work:draw()
    end
end
