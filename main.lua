Pnj = {}

function love.load()
    local anim8 = require 'anim8/anim8'

    Pnj.x = 400
    Pnj.y = 300
    Pnj.sprite = love.graphics.newImage('')
    Pnj.spriteSheet = love.graphics.newImage('sprites/Pnj')
    Pnj.grid = anim8.newGrid
end

function love.update(dt)
end

function love.draw()
end
