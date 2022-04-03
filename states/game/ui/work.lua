require("modules/key")
require("states/game/ui/alert")

require("modules/audio")

Work = {}

function Work:load()
    Work.x = Box.x
    Work.y = Box.y + Box.height + 20
    Work.width = Box.width
    Work.height = 150
    Work.clicks = 0
    Work.finished = false
    Work.countdown = 0
end

function Work:update(dt)
    if Work.finished then
        if Work.countdown == 20 then
            Game.alert.state = true
            Game.alert.text = "You can work again in one minute"
        end
        if Work.countdown >= 0 then
            Work.countdown = Work.countdown - dt
        else
            Work.finished = false
            Work.countdown = 0
            Work.clicks = 0
            Game.alert.state = true
            Game.alert.text = "You can go back to work now"
        end
    end
end

function Click()
    if Game.working then
        if Work.clicks < 49 then
            Work.clicks = Work.clicks + 1
        else
            Game.working = false
            Work.countdown = 20
            Work.finished = true
            Stats.money = Stats.money + 1000
            Audio:play("assets/sounds/alert.wav")
        end
    end
end

function Work:draw()
    love.graphics.setColor(0, 0, 0, 0.3)
    love.graphics.rectangle("fill", Work.x, Work.y, Work.width, Work.height)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf("You are in work", love.graphics.newFont(20), Work.x, Work.y + 20, Work.width, "center")
    love.graphics.printf("Click the 'W' button 50 times to get paycheck", love.graphics.newFont(15), Work.x, Work.y + 50, Work.width, "center")
    love.graphics.setColor(0.5, 0.5, 0.5, 1)
    love.graphics.printf(Work.clicks, love.graphics.newFont(15), Work.x, Work.y + 70, Work.width, "center")
    love.graphics.setColor(1, 1, 1, 1)
    Key:down("w", Click)
end