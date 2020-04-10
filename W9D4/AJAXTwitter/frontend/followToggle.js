class FollowToggle {
  constructor(el) { // el = the button 
    this.$el = $(el);
    this.userID = this.$el.data("user-id"); // should not be jquery objs, these are attributes
    this.followState = this.$el.data("initial-follow-state"); // returns boolean 
    this.render();
    this.$el.on("click", this.handleClick.bind(this)); // why in the constructor?
  }

  render() { // use jquery methods here. should change html of element
    if (this.followState) { 
      this.$el.text("Unfollow!");
    } else {
      this.$el.text("Follow!");
    }
  }

  handleClick(event){
    // console.log(this)
    event.preventDefault();
    let that = this;
    $.ajax({ // maybe separate out ajax requests
      method: (this.followState) ? "DELETE" : "POST",
      url: `/users/${this.userID}/follow`,
      dataType: 'JSON',
      success: function() {
        that.followState = (that.followState) ? false : true;
        that.render();
      }
    })
  }

};

module.exports = FollowToggle;
