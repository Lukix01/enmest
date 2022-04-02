Timer = {
    time = 0
}

function Timer:start(dt, time, fn)
    self.time = self.time + dt
    -- print(self.time)
    if (time and fn and self.time >= time) then
        fn()
        self.time = 0
    end
    return self.time
end