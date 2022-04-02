Timer = {
    time = 0
}

function Timer:update(dt)
    Timer.time = Timer.time + dt
    print(Timer.time)
end