// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

const color = document.querySelector('#colorPicker')

const colorBg = () => {
    document.body.style.backgroundColor = color.value;
}

color.addEventListener(`input`, colorBg)