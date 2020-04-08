const Asteroid = require('./asteroid.js');
const Ship = require('./ship');

function Game(){
    this.asteroids = [];
    this.addAsteroids();
    this.ship = new Ship({pos: this.randomPosition(), game: this});
}

Game.DIM_X = 1000;
Game.DIM_Y = 1000;
Game.NUM_ASTEROIDS = 20;

Game.prototype.addAsteroids = function(){
    for (let i = 0; i < Game.NUM_ASTEROIDS; i++){
        let x = Math.random()*1000;
        let y = Math.random()*1000;
        let ast = new Asteroid({pos: [x,y], game: this});
        this.asteroids.push(ast);
    }
}

Game.prototype.draw = function(ctx){
    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
    this.allObjects().forEach((object) => {
        object.draw(ctx);
    } )
}

Game.prototype.move = function(){
    this.allObjects().forEach((object) =>{
        object.move();
    })
}


Game.prototype.wrap = function(pos) {

    let xWrapped = pos[0]%Game.DIM_X;
    let yWrapped = pos[1]%Game.DIM_Y;
    return [xWrapped, yWrapped];
}

Game.prototype.checkCollisions = function() {
   
    for (let i = 0; i <this.allObjects().length-1; i++){
        for (let j = i+1; j <this.allObjects().length; j++){
            if (this.allObjects()[i].isCollidedWith(this.allObjects()[j])) {
                this.allObjects()[i].collideWith(this.allObjects()[j])
            }
        }
    }

}

Game.prototype.step = function(){
    this.move();
    this.checkCollisions();
    
}

Game.prototype.remove = function(asteroid) {
    this.asteroids.splice(this.asteroids.indexOf(asteroid), 1)
}

Game.prototype.randomPosition = function(){
    let x = Math.random() * Game.DIM_X;
    let y = Math.random() * Game.DIM_Y;
    return [x,y];
}

Game.prototype.allObjects = function(){
    let a = [...this.asteroids, this.ship]
    // console.log(a);
    return a;
};


module.exports = Game;