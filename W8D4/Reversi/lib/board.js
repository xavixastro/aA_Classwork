let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = [];
  for(let i=0; i < 8; i++){
    grid.push( new Array(8))
  }
  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");
  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (!this.isValidPos(pos))
    throw new Error('Not valid pos!');
  else{
    return this.grid[pos[0]][pos[1]];
  }
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length !== 0
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (!this.isOccupied(pos)) {
    return false;
  }
  return this.getPiece(pos).color === color;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return this.getPiece(pos) !== undefined;
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return (!this.hasMove("black") && !this.hasMove("white"))
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let validRange = [0, 1, 2, 3, 4, 5, 6, 7];
  return (validRange.includes(pos[0]) && validRange.includes(pos[1]));
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {
  //get next position
  pos = [pos[0] + dir[0], pos[1] + dir[1]];
  if (!board.isValidPos(pos)){ //off the board
      return null;
  }
  else if (!board.isOccupied(pos)){ //null if empty
      return null;
  }
  else if (board.isMine(pos, color)){ //my color
    //check opponent pieces in between
    if (piecesToFlip.length !== 0)
      return piecesToFlip;
    else 
      return null;
  }
  else { //if (!board.isMine(pos, color)) --> opponent's piece
      //save piece, move to next one
      piecesToFlip.push(board.getPiece(pos));
      return _positionsToFlip(board, pos, color, dir, piecesToFlip);
  }
}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos,color)){
    throw new Error("Invalid Move");
  }
  else{
    //set new piece
    this.grid[pos[0]][pos[1]] = new Piece(color);
    let flipPieces = [];
    //find all opponent pieces to be flipped
    for (let i = 0; i < Board.DIRS.length; i++) {
      let result = _positionsToFlip(this, pos, color, Board.DIRS[i], []);
      if (result !== null){
        flipPieces = flipPieces.concat(result);
      }
    }
    //flip the pieces
    for (let i = 0; i < flipPieces.length; i++){
      flipPieces[i].flip();
    }
  }
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  console.log("  0  1  2  3  4  5  6  7");
  let spacer = "➖";
  for (let i = 0; i < this.grid.length; i++){
    // console.log(this.grid[i].join(' '))
    let row = []
    for (let j = 0; j < this.grid[0].length; j++){
      row.push((this.grid[i][j]) ? this.grid[i][j].toString() : spacer)
    }
    console.log(`${i} ${row.join(" ")}`);
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  //check if empty
  if (this.isOccupied(pos)){
      return false;
  }
  else{ //empty --> call positionsToFlip for each direction
    for (let i = 0; i < Board.DIRS.length; i++){
      let result = _positionsToFlip(this, pos, color, Board.DIRS[i], []);
      if (result !== null){
        return true;
      }
    }
    return false;
  }
};  

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
 let moves = [];
 for (let i = 0; i < this.grid.length; i++){
   for (let j = 0; j < this.grid[0].length; j++){
      let pos = [i,j];
      if (this.validMove(pos,color)){
        moves.push(pos);
      }
   }
 }
 return moves;
};

module.exports = Board;
