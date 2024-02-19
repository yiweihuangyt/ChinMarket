document.addEventListener('DOMContentLoaded', function() {
  var currentIndex = 0;
  var totalImages = document.querySelectorAll('.carousel img').length;
  var carousel = document.querySelector('.carousel');

  function changeSlide(direction) {
    if (direction === 1 && currentIndex < totalImages - 1) {
      currentIndex++;
    } else if (direction === -1 && currentIndex > 0) {
      currentIndex--;
    } else if (direction === -1) {
      currentIndex = totalImages - 1;
    } else {
      currentIndex = 0;
    }
    updateCarousel();
  }

  function updateCarousel() {
    var newTransformValue = -currentIndex * 100 + '%';
    carousel.style.transform = 'translateX(' + newTransformValue + ')';
  }

  window.changeSlide = changeSlide;
});