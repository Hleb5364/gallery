$(function(){
  $('body').on('change', '[data-image-file]', function(){
    compareImages(this)
  })
})

function compareImages(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      var img = new Image;
      img.onload = function() {
        if(compareSize(img, $("img").get(0))){
          if(compareExtension()){
            $('[data-image-file]').val(null)
            $('[data-image-label]').text("Додати схожу картинку до галереї")
          }
        }
      };
      img.src = reader.result;
    };
    reader.readAsDataURL(input.files[0]);
  }
}

function compareSize(similarImg, originalImg){
  if(compareWidth(similarImg.width, originalImg.naturalWidth) && compareHeight(similarImg.height, originalImg.naturalHeight)){
    alert("Розміри картинки мають бути " + $("img").get(0).naturalWidth + "x" + $("img").get(0).naturalHeight + " +-10%")
    return true
  }
}

function compareWidth(similarImgWidth, originalImgWidth){
  if((originalImgWidth + originalImgWidth * 0.1) >= similarImgWidth && (originalImgWidth - originalImgWidth * 0.1) <= similarImgWidth){
    return false
  }
  else{
    return true
  }
}

function compareHeight(similarImgHeight, originalImgHeight){
  if((originalImgHeight + originalImgHeight * 0.1) >= similarImgHeight && (originalImgHeight - originalImgHeight * 0.1) <= similarImgHeight){
    return false
  }
  else{
    return true
  }
}

function compareExtension(){
  var imageExtension = $('[data-image-file]')[0].files[0].name.split(".")[1]
  var similarImageExtension = $("[data-main-image]")[0].src.split(".")[1]
  if (imageExtension !=  similarImageExtension) {
    alert("Розширення картинки має бути " + imageExtension)
    return true
  }
}
