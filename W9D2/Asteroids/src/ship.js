const Util = require('./util.js');
// const Game = require('./game.js');
const MovingObject = require('./moving_object');

function Ship(options){
    options['vel'] = [0, 0];
    options['radius'] = Ship.RADIUS;
    options['color'] = Ship.COLOR;
    MovingObject.call(this, options);
}

Ship.RADIUS = 10;
Ship.COLOR = "blue";

Util.inherits(Ship, MovingObject)

Ship.prototype.relocate = function(){
    console.log(this.pos);
    this.pos = this.game.randomPosition();
    console.log("I was hit");
    console.log(this.pos);
    this.vel = [0,0];
}

module.exports = Ship;

