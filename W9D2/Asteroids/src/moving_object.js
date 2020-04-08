function MovingObject(options){
    this.pos = options["pos"];
    this.vel = options["vel"];
    this.radius = options["radius"];
    this.color = options["color"];
    this.game = options["game"];
}

MovingObject.prototype.draw = function(ctx){
    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI*2, true);
    ctx.fillStyle = this.color;
    ctx.fill();
    ctx.lineWidth = 2;
    ctx.stroke()
}


MovingObject.prototype.move = function() { 
    let newPos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1] ];
    let wrappedPos = this.game.wrap(newPos);
    this.pos = wrappedPos;
}

// // this is math, not JavaScript
// Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)

MovingObject.prototype.isCollidedWith = function(otherObject) {
    let distance = Math.sqrt((this.pos[0] - otherObject.pos[0]) ** 2 + (this.pos[1] - otherObject.pos[1])**2 );
    return distance < this.radius + otherObject.radius
}

MovingObject.prototype.collideWith = function(otherObject) {
    // this.game.remove(otherObject);
    // this.game.remove(this)

}


module.exports = MovingObject;