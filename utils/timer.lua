Timer = {
    instances = {
        { time = 0 },
        { time = 1 }
    }
}

function Timer:start(dt, instances)
    for i, instance in ipairs(instances) do
        Timer.instances[i].time = Timer.instances[i].time + dt
        if instance.timeLimit and instance.fn and Timer.instances[i].time >= instance.timeLimit then
            instance.fn()
            Timer.instances[i].time = 0
        end
    end
end
