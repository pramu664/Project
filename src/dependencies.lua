push = require "lib/push"
particle = require "lib/particle"
class = require "lib/class"
utils = require "lib/utils"

require "src/constants"
require "src/StateMachine"

require "src/states/BaseState"
require "src/states/menuState"
require "src/states/playState"

require "src/Projectile"
require "src/Enemy"
require "src/Player"

gSounds = {
    ['projectileInstantiation'] = love.audio.newSource('sounds/projectileInstantiation.wav', 'static'),
    ['projectileCollisionWalls'] = love.audio.newSource('sounds/projectileCollisionWalls.wav', 'static'),
    ['projectileCollisionEnemy'] = love.audio.newSource('sounds/projectileCollisionEnemy.wav', 'static'),
    ['enemyCollisionWalls'] = love.audio.newSource('sounds/enemyCollisionWalls.wav', 'static'),
    ['enemyCollisionPlayer'] = love.audio.newSource('sounds/enemyCollisionPlayer.wav', 'static'),
}
