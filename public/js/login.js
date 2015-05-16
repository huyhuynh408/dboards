$(document).ready(function(){
  $('.login_link').click(function(event){
    event.preventDefault();
    $(this).hide();

    var request = $.ajax({
      url: '/login'
    });

    request.done(function(response){
      console.log("finished");
      $('nav ul').append("hello")
    });

  });
});
