// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('turbo:load', () => {
  const nextButton = document.getElementById('next-button');
  const form = document.querySelector('section.app-body form');

  if (nextButton) {
    nextButton.addEventListener('click', function() {
      form.submit();
    });
  }

  if (form) {
    form.addEventListener('keydown', function(event) {
      if (event.key === 'Enter') {
        event.preventDefault();
        form.submit();
      }
    });
  }
});