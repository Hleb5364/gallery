// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'bootstrap'

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


$(function(){
  $("[data-select-gallery]").change(function() {
    if (this.selectedIndex!==0) {
      window.location.href = this.value
    }
  })

  $('body').on('change', '[data-image-file]', function(){
    updateUploadedImage(this)
  })
})

function updateUploadedImage(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      var fileName = $('[data-image-file]')[0].files[0].name
      if (fileName.length > 20) {
        fileName = fileName.substring(0, 20) + "...";
      }

      $('[data-image-label]').text(fileName)
    }

    reader.readAsDataURL(input.files[0]);
  }
}

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
