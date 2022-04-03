Alert = {
    timeLeft = 6
}

function Alert:load()
    Alert.state = false
    Alert.width = 250
    Alert.height = 250
    Alert.x = Box.x - Alert.width - 50
    Alert.y = love.graphics.getHeight() / 2 - 250 / 2
end

function Alert:update(dt)
    Alert.state = true
    if Game.alert and Alert.timeLeft >= 0 then
        Alert.timeLeft = Alert.timeLeft - dt
    else
        Alert.state = false
        Alert.timeLeft = 6
        Game.alert = false
    end
    print(Alert.timeLeft)
end

function Alert:draw()
    if Alert.state then
        love.graphics.setColor(0, 0, 0, 0.3)
        love.graphics.rectangle("fill", Alert.x, Alert.y, Alert.width, Alert.height )
        love.graphics.setColor(1, 1, 1, 1)
        -- love.graphics.printf("New alert!", love.graphics.newFont(20), Alert.x, Alert.y, Alert.width, "right")
    end
end