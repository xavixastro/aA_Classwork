const FollowToggle = require("./followToggle.js");

$( () => {
  $(".follow-toggle").each( (i, button) => {
    new FollowToggle(button);
  }) 
})