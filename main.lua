local avion = {}
Pnj = {}

function love.load()
    
    local anim8 = require'anim8/anim8'
    love.graphics.setDefaultFilter('nearest', 'nearest')

    avion.x = 400
    avion.y = 400
    avion.sprite = love.graphics.newImage('sprites/test_avions.png')
    avion.grid = anim8.newGrid(32, 31, avion.sprite:getWidth(), avion.sprite:getHeight(), 3, 135, 1)
    avion.animation = anim8.newAnimation(avion.grid('1-8', 1), 0.3)

    Pnj.x = 0
    Pnj.y = 0
    Pnj.sprite = love.graphics.newImage('sprites/Pnj-original.png')
    Pnj.grid = anim8.newGrid(175, 245, Pnj.sprite:getWidth(), Pnj.sprite:getHeight(), 0, 1070, 4)
    Pnj.animation = anim8.newAnimation(Pnj.grid('1-7', '1-2'), 0.1)

end

function love.update(dt)

    avion.animation:update(dt)
    Pnj.animation:update(dt)

end

function love.draw()

    avion.animation:draw(avion.sprite, avion.x, avion.y, nil, 5)    
    Pnj.animation:draw(Pnj.sprite, Pnj.x, Pnj.y)
end