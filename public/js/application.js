$(document).ready(function(){
    $(".textbox").click(function(){
        $("#background").hide(900);
    });
});


$(document).ready(function(){
  // this ID here refers to the form where the usesr types in a URL, you may have a different name for the ID. Edit the code accordingly.
 $('#url-form').submit(function(e){ 
    e.preventDefault();         
    $.ajax({
      url: '/urls', //this refers to the route post '/urls'
      method: 'POST',
      dataType: 'json',
      data: $(this).serialize(),
      success: function(data){
      // write some code here to display the shortened URL
          if(data.short_url){
            $("#result").html("Your shortened URL is " + "<a href='/" + data.short_url + "'>"+ "it.ly/" +data.short_url + "</a>");
          }
          else
          {
           alert("Your input is invaild!");
          }
     },
     //  error: function(data){
     //    alert("Your input is invaild!");
     // }
    }); // end of function .ajax
  }); // end of function .submit  
}); // end of function document.ready