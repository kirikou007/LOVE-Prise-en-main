_dino = {}

function love.load()
    local wf = require "libraries/windfield/windfield"
    local anim8 = require "libraries/anim8/anim8"
    love.graphics.setDefaultFilter("nearest", "nearest")

    world = wf.newWorld(0, 0, true)
    world:setGravity(0, 512)
    world:addCollisionClass("sol")
    world:addCollisionClass("dino")

    _dino.x = 100 - 50 / 2
    _dino.y = 440 - 50 / 2
    _dino.sprite = love.graphics.newImage("sprites/_dino.png")
    _dino.grid = anim8.newGrid(50, 50, _dino.sprite:getWidth(), _dino.sprite:getHeight())
    _dino.animation = anim8.newAnimation(_dino.grid("4-5", 1), 0.3)

    _dino.hitbox = world:newRectangleCollider(_dino.x, _dino.y, 50, 50)
    _dino.hitbox:setCollisionClass("dino")

    sol = world:newRectangleCollider(0, 475, 800, 125)
    sol:setType("static")
    sol:setCollisionClass("sol")
end

function love.update(dt)
    _dino.animation:update(dt)
    world:update(dt)
end

function love.draw()
    love.graphics.setBackgroundColor(0.5, 0.5, 0.5)
    world:draw()
    _dino.animation:draw(_dino.sprite, _dino.x, _dino.y, nil, 1.2)
end

function love.keypressed(key)
    if key == "space" then
        _dino.hitbox:applyLinearImpulse(0, -1000)
    end
end
