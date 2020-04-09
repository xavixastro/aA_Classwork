class View {
  constructor(game, $el) {
    this.el = $el;
    this.game = game;
    this.setupBoard();
  }

  bindEvents(pos) {
    let that = this;
  }

  makeMove($square) {
    let val = $square.target.value;
    // console.log(val);
    let pos = this.generatePosition(val);
    this.game.playMove(pos);

    // this.game.playMove.bindEvents(this, pos)
  }

  generatePosition(val) {
    if (val === 0){
      return [0,0]
    }
    else if (val === 1){
      return [0,1]
    }
    else if (val === 2) {
      return [0, 2]
    }
    else if (val === 3) {
      return [1, 0]
    }
    else if (val === 4) {
      return [1, 1]
    }
    else if (val === 5) {
      return [1, 2]
    }
    else if (val === 6) {
      return [2, 0]
    }
    else if (val === 7) {
      return [2, 1]
    }
    else if (val === 8) {
      return [2, 2]
    }

  }

  setupBoard() {
      let $row = $("<ul></ul>");
      for (let j = 0; j < 9; j++) {
        let $cell = $(`<li value='${j}'></li>`);

        $row.append($cell);
      }
      this.el.append($row);
  }
}
module.exports = View;