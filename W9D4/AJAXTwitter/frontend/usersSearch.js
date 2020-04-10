

class UsersSearch {
  constructor(el) {
    this.$el = el; //
    this.input = $el.$("input");
    this.ul = $el.$("ul");

    handleInput(e){
        e.preventDefault();
        // convert to json obj, pass that to searchUsers
        APIUtil.searchUsers()
        
    }
  }



}

module.exports = UsersSearch;
