$(document).ready(function() {

    // drag and drop for stories
    $("#story-list").sortable({ handle: '.story', axis: 'y' });

    //complete stories on click
    $(".done").click(function(){
        $(this).hide();
        $(this).parent().animate({backgroundColor: '#fef7db'}, 'slow');
        $(this).parent().find(".story_type").css('background-image', 'url(spinner.gif)');
        $.get("done/"+$(this).attr("name"), function (data){
            $('#li_'+data).find(".story_type").remove();
            $('#li_'+data).slideUp('slow', function(){
                $('#li_'+data).remove();
            });
        });
    });

    //preload spinner image
    var cacheImage = document.createElement('img');
    cacheImage.src = 'spinner.gif';
});

