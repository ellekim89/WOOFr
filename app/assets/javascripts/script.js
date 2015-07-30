
$(function() {

      $('.toggle').click(function (event) {
        event.preventDefault();
        var target = $(this).attr('href');
        $(target).toggleClass('hidden show');
    });

  $("#tinderslide").jTinder({
    onDislike: function (item) {
      this.current_iterator --
      // Poor puppy.
    },
    onLike: function (item) {
      dog_id = ($($("#tinderslide li")[this.current_iterator]).find("span.dog_id").text());
      csrf = $('meta[name="csrf-token"]').attr('content');
      // i = 0;
      // if (i < 25) {
        // var dogToSave = item[i];

        // var name = "";
        // var photo = "";
        // var description = "";
        // var pf_id = "";

        // console.log(dogToSave);

        // $.each(dogToSave, function(x) {
        //   console.log(x);
        // })
        // i += 1;
      // }
       $.ajax("/favorites", {"method":"POST", "data":
        "dog_id=" + escape(dog_id) + "&csrf=" + escape(csrf), "error": function(request, status, error){
          console.log(request.responseText);
        }}




        );
       console.log(csrf);

        // console.log($($("#tinderslide li")[this.current_iterator]).find("span.pf_id").text());
         this.current_iterator --

    },
    animationRevertSpeed: 200,
    animationSpeed: 400,
    threshold: 1,
    likeSelector: '.like',
    dislikeSelector: '.dislike',
    current_iterator: 24
  });
  // $("#tinderslide").on("click", "li", function(){
  //   //SAVE DOG VIA AJAX HERE

  // });

$('.actions .like, .actions .dislike').click(function(e){
  e.preventDefault();
  $("#tinderslide").jTinder($(this).attr('class'));
});



})