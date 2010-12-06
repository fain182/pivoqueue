$(document).ready(function() {

    $("#story-list").sortable({
        handle: '.story',
        axis: 'y'
    });

    function update_story_count() {
        var count = $("#story-list").children().length;
        $("#story-count").html(count+' stories');
    }

   function preload_spinner_image() {
        var cacheImage = document.createElement('img');
        cacheImage.src = '/spinner.gif';
    }

    //complete stories on click
    $(".done").click(function() {
        $(this).hide();
        $(this).parent().animate({backgroundColor: '#fef7db'}, 'slow');
        $(this).parent().find(".story_type").css('background-image', 'url(/spinner.gif)');
        $.get("done/"+$(this).attr("name"), function (data){
            $('#li_'+data).find(".story_type").remove();
            $('#li_'+data).slideUp('slow', function(){
                $('#li_'+data).remove();
                update_story_count();
            });
        });
    });

    //ON START
    update_story_count();
    preload_spinner_image();
});

