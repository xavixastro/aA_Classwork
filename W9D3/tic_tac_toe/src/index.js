const View = require('./ttt-view.js');
const Game = require('./game.js');
const Board = require('./board.js');
const MoveError = require('./moveError.js');


  $(() => {
    // Your code here
    const game = new Game();
    const $query = $(".ttt");
    const view = new View(game, $query)

    $("li").on ("click", (e) =>{
      view.makeMove(e);
    })
  });


{/* <ul>
  <li>Racecars</li>
  <li>Lasers</li>
  <li>Aeroplanes</li>
</ul>

<script>
  // Two ways of doing the same thing:
  console.log("JQUERY WAY");
  // returns a jQuery object; the leading dollar-sign in front of
  // $listItems is conventional; it is just part of the variable name.
  const $listItems = $("li");
  for (let i = 0; i < $listItems.length; i++) {
    console.log($listItems[i].textContent);
  }
</script> */}