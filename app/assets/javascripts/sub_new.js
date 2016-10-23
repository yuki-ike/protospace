$(function sub_image(){
    var setFileInput = $('.js-file-subInput');

    setFileInput.each(function(){
        var selfFile = $(this),
        selfInput = $(this).find('input[type=file]');

        selfInput.change(function(){
            var file = $(this).prop('files')[0],
            fileRdr = new FileReader(),
            selfImg = selfFile.find('.img_View');

            if(!this.files.length){
                if(0 < selfImg.size()){
                    selfImg.remove();
                    return;
                }
            } else {
                if(file.type.match('image.*')){
                    if(!(0 < selfImg.size())){
                        selfFile.append('<img alt="" class="img_View">');
                    }
                    var prevElm = selfFile.find('.img_View');
                    fileRdr.onload = function() {
                        prevElm.attr('src', fileRdr.result);
                    }
                    fileRdr.readAsDataURL(file);
                } else {
                    if(0 < selfImg.size()){
                        selfImg.remove();
                        return;
                    }
                }
            }
        });
    });
});


$(window).on("load", function() {
    $("#add_new_form").on("click", function(){
        $(this).addClass("li.list-group-item.col-md-4.hide_form");
        $("li.list-group-item.col-md-4#add_new_form").hide();
        console.log(this.id);
        $("." + this.id).show();
    });
});
