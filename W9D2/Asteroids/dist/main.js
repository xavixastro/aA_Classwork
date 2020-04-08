/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\n\nfunction Asteroid(options) {\n    options[\"vel\"] = Util.randomVec((Math.random() * 10)+5)\n    options[\"color\"] = Asteroid.COLOR;\n    options[\"radius\"] = Asteroid.RADIUS;\n    MovingObject.call(this, options)\n\n}\n\nAsteroid.COLOR = '#2D2D2D';\nAsteroid.RADIUS = 20;\n\nUtil.inherits(Asteroid, MovingObject);\n\nAsteroid.prototype.collideWith = function(otherObject){\n    if (otherObject instanceof Ship){\n        otherObject.relocate();\n    }\n}\n\n\nmodule.exports = Asteroid;\n\n\n\n// function Random(a) {\n//     this.prop = a;\n// }\n\n\n// let p = new Random(\"one\");\n// let p2 = new Random(\"two\");\n// let p3 = new Random(\"three\");\n\n// let arr = [];\n\n// arr.push(p);\n// arr.push(p2);\n// arr.push(p3);\n\n// console.log(arr)\n// arr.splice(arr.indexOf(p),1);\n// console.log(arr)\n\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\");\n\nfunction Game(){\n    this.asteroids = [];\n    this.addAsteroids();\n    this.ship = new Ship({pos: this.randomPosition(), game: this});\n}\n\nGame.DIM_X = 1000;\nGame.DIM_Y = 1000;\nGame.NUM_ASTEROIDS = 20;\n\nGame.prototype.addAsteroids = function(){\n    for (let i = 0; i < Game.NUM_ASTEROIDS; i++){\n        let x = Math.random()*1000;\n        let y = Math.random()*1000;\n        let ast = new Asteroid({pos: [x,y], game: this});\n        this.asteroids.push(ast);\n    }\n}\n\nGame.prototype.draw = function(ctx){\n    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);\n    this.allObjects().forEach((object) => {\n        object.draw(ctx);\n    } )\n}\n\nGame.prototype.move = function(){\n    this.allObjects().forEach((object) =>{\n        object.move();\n    })\n}\n\n\nGame.prototype.wrap = function(pos) {\n\n    let xWrapped = pos[0]%Game.DIM_X;\n    let yWrapped = pos[1]%Game.DIM_Y;\n    return [xWrapped, yWrapped];\n}\n\nGame.prototype.checkCollisions = function() {\n   \n    for (let i = 0; i <this.allObjects().length-1; i++){\n        for (let j = i+1; j <this.allObjects().length; j++){\n            if (this.allObjects()[i].isCollidedWith(this.allObjects()[j])) {\n                this.allObjects()[i].collideWith(this.allObjects()[j])\n            }\n        }\n    }\n\n}\n\nGame.prototype.step = function(){\n    this.move();\n    this.checkCollisions();\n    \n}\n\nGame.prototype.remove = function(asteroid) {\n    this.asteroids.splice(this.asteroids.indexOf(asteroid), 1)\n}\n\nGame.prototype.randomPosition = function(){\n    let x = Math.random() * Game.DIM_X;\n    let y = Math.random() * Game.DIM_Y;\n    return [x,y];\n}\n\nGame.prototype.allObjects = function(){\n    let a = [...this.asteroids, this.ship]\n    // console.log(a);\n    return a;\n};\n\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView(ctx){\n    this.game = new Game();\n    this.ctx = ctx;\n}\n\n\nGameView.prototype.start = function(){\n\n    window.setInterval(() => {\n        this.game.step();\n        this.game.draw(this.ctx)\n    }, 20)\n\n}\n\n\nmodule.exports = GameView;\n\n\n\n\n\n\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\n\nwindow.MovingObject = MovingObject;\n\nwindow.addEventListener('DOMContentLoaded', (event) => {\n    let canvas = document.getElementById('game-canvas');\n    var ctx = canvas.getContext('2d');\n\n\n    // const Ast = new Asteroid({pos: [100,100]})\n    // Ast.draw(ctx);\n    // console.log(Ast.pos)\n    // Ast.move()\n    // console.log(Ast.pos)\n\n    // Ast.draw(ctx);\n\n    // const game = new Game();\n    // console.log(game.asteroids[0].pos);\n    // game.draw(ctx);\n    // game.move();\n    // console.log(game.asteroids[0].pos);\n    // game.draw(ctx);\n\n    const gameView = new GameView(ctx);\n    gameView.start();\n\n\n\n    // const mo = new MovingObject({\n    //     pos: [100, 100],\n    //     vel: [10, 10],\n    //     radius: 50,\n    //     color: \"red\"\n    // });\n    // mo.draw(ctx);\n});\n\n\n\nconsole.log(\"Webpack is working!\")\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(options){\n    this.pos = options[\"pos\"];\n    this.vel = options[\"vel\"];\n    this.radius = options[\"radius\"];\n    this.color = options[\"color\"];\n    this.game = options[\"game\"];\n}\n\nMovingObject.prototype.draw = function(ctx){\n    ctx.beginPath();\n    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI*2, true);\n    ctx.fillStyle = this.color;\n    ctx.fill();\n    ctx.lineWidth = 2;\n    ctx.stroke()\n}\n\n\nMovingObject.prototype.move = function() { \n    let newPos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1] ];\n    let wrappedPos = this.game.wrap(newPos);\n    this.pos = wrappedPos;\n}\n\n// // this is math, not JavaScript\n// Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)\n\nMovingObject.prototype.isCollidedWith = function(otherObject) {\n    let distance = Math.sqrt((this.pos[0] - otherObject.pos[0]) ** 2 + (this.pos[1] - otherObject.pos[1])**2 );\n    return distance < this.radius + otherObject.radius\n}\n\nMovingObject.prototype.collideWith = function(otherObject) {\n    // this.game.remove(otherObject);\n    // this.game.remove(this)\n\n}\n\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\n// const Game = require('./game.js');\nconst MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\n\nfunction Ship(options){\n    options['vel'] = [0, 0];\n    options['radius'] = Ship.RADIUS;\n    options['color'] = Ship.COLOR;\n    MovingObject.call(this, options);\n}\n\nShip.RADIUS = 10;\nShip.COLOR = \"blue\";\n\nUtil.inherits(Ship, MovingObject)\n\nShip.prototype.relocate = function(){\n    console.log(this.pos);\n    this.pos = this.game.randomPosition();\n    console.log(\"I was hit\");\n    console.log(this.pos);\n    this.vel = [0,0];\n}\n\nmodule.exports = Ship;\n\n\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n\n    inherits(childClass, parentClass) {\n        childClass.prototype = Object.create(parentClass.prototype);\n        childClass.prototype.constructor = childClass;\n    },\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });