const Util = require("./util.js");
const Ship = require("./ship.js");
const MovingObject = require("./moving_object.js");


function Asteroid(options) {
    options["vel"] = Util.randomVec((Math.random() * 10)+5)
    options["color"] = Asteroid.COLOR;
    options["radius"] = Asteroid.RADIUS;
    MovingObject.call(this, options)

}

Asteroid.COLOR = '#2D2D2D';
Asteroid.RADIUS = 20;

Util.inherits(Asteroid, MovingObject);

Asteroid.prototype.collideWith = function(otherObject){
    if (otherObject instanceof Ship){
        otherObject.relocate();
    }
}


module.exports = Asteroid;



// function Random(a) {
//     this.prop = a;
// }


// let p = new Random("one");
// let p2 = new Random("two");
// let p3 = new Random("three");

// let arr = [];

// arr.push(p);
// arr.push(p2);
// arr.push(p3);

// console.log(arr)
// arr.splice(arr.indexOf(p),1);
// console.log(arr)
