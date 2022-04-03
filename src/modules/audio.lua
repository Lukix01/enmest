Audio = {}

function Audio:play(dir)
    sound = love.audio.newSource(dir, "static")
    sound:play()
end