document.addEventListener('DOMContentLoaded', function () {
  var input = document.getElementById('user_image');
  var preview = document.getElementById('new-user-image');

  input.addEventListener('change', function () {
    var file = input.files[0];
    var reader = new FileReader();

    reader.onload = function (e) {
      preview.innerHTML = '<img src="' + e.target.result + '" class="user-mypage-thumbnail rounded-circle" />';
    };

    reader.readAsDataURL(file);
  });
});