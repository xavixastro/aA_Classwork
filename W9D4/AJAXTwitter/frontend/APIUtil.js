const APIUtil = {
  followUser: id => {
    // ...
  },

  unfollowUser: id => {
    // ...
  },

  searchUsers: () => {
    let $input = $(input)
    let un = $input.val()
    return $.ajax({
      method: "GET",
      url: "/users/search",
      dataType: "JSON",
      data: {
          'username': un
      },
      success: function(){
        // what do we do on the success?
      }

    }) 
  }
 };

module.exports = APIUtil;


$.ajax({
  type: 'POST',
  url: 'php/function.php',
  data: {
    'foo': 'bar',
  },
  success: function (data) {
    var quote = data[0];
    $('#content').html(quote);
  }
});

//Then in your PHP Script you can access 
//$_POST['foo'] which should be populated with bar.