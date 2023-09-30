document.addEventListener('DOMContentLoaded', function () {
  var input = document.getElementById('post_image');
  var preview = document.getElementById('new-post-image');

  input.addEventListener('change', function () {
    var file = input.files[0];
    var reader = new FileReader();

    reader.onload = function (e) {
      preview.innerHTML = '<img src="' + e.target.result + '" class="img-fluid" />';
    };

    reader.readAsDataURL(file);
  });
});