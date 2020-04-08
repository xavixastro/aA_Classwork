const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js");

window.MovingObject = MovingObject;

window.addEventListener('DOMContentLoaded', (event) => {
    let canvas = document.getElementById('game-canvas');
    var ctx = canvas.getContext('2d');


    // const Ast = new Asteroid({pos: [100,100]})
    // Ast.draw(ctx);
    // console.log(Ast.pos)
    // Ast.move()
    // console.log(Ast.pos)

    // Ast.draw(ctx);

    // const game = new Game();
    // console.log(game.asteroids[0].pos);
    // game.draw(ctx);
    // game.move();
    // console.log(game.asteroids[0].pos);
    // game.draw(ctx);

    const gameView = new GameView(ctx);
    gameView.start();



    // const mo = new MovingObject({
    //     pos: [100, 100],
    //     vel: [10, 10],
    //     radius: 50,
    //     color: "red"
    // });
    // mo.draw(ctx);
});



console.log("Webpack is working!")