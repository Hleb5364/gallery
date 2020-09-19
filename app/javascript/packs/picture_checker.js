$(function(){
  $('body').on('change', '[data-image-file]', function(){
    compareImages(this)
    // var imageExtension = $('[data-image-file]')[0].files[0].name.split(".")[1]
    // var similarImageExtension = $("[data-main-image]")[0].src.split(".")[1]
    // if (imageExtension !=  similarImageExtension) {
    //   compareImagesSize(this)
    //   $('[data-image-file]').val(null)
    //   $('[data-image-label]').text("Додати схожу картинку до галереї")
    //   alert("Розширення картинки має бути " + imageExtension)
    // }
  })
})

function compareImages(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      var img = new Image;
      img.onload = function() {
        if(img.width != $("img").get(0).naturalWidth && img.height != $("img").get(0).naturalHeight){
          alert("Розміри картинки мають бути " + $("img").get(0).naturalWidth + "x" + $("img").get(0).naturalHeight)
          compareExtension()
        }
      };
      img.src = reader.result;
    };
    reader.readAsDataURL(input.files[0]);
  }
}

function compareExtension(){
  var imageExtension = $('[data-image-file]')[0].files[0].name.split(".")[1]
  var similarImageExtension = $("[data-main-image]")[0].src.split(".")[1]
  if (imageExtension !=  similarImageExtension) {
    $('[data-image-file]').val(null)
    $('[data-image-label]').text("Додати схожу картинку до галереї")
    alert("Розширення картинки має бути " + imageExtension)
  }
}
