$(function(){
  $('body').on('change', '[data-image-file]', function(){
    var imageExtension = $('[data-image-file]')[0].files[0].name.split(".")[1]
    var similarImageExtension = $("[data-main-image]")[0].src.split(".")[1]
    debugger
    if (imageExtension !=  similarImageExtension) {
      $('[data-image-file]').val(null)
      $('[data-image-label]').text("Додати схожу картинку до галереї")
      alert("Розширення картинки має бути " + imageExtension)
    }
    
  })
})
