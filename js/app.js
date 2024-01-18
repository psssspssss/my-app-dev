//import Swiper from 'swiper';

let navbar = document.querySelector('.header .navbar');
let searchForm = document.querySelector('.header .search-form');
let loginForm = document.querySelector('.header .login-form');
let contactInfo = document.querySelector('.contact-info');

document.querySelector('#menu-btn').onclick = () => {
    navbar.classList.toggle('active');
    searchForm.classList.remove('active');
    loginForm.classList.remove('active');
};

document.querySelector('#search-btn').onclick = () => {
    searchForm.classList.toggle('active');
    navbar.classList.remove('active');
    loginForm.classList.remove('active');
};

document.querySelector('#login-btn').onclick = () => {
    loginForm.classList.toggle('active');
    navbar.classList.remove('active');
    searchForm.classList.remove('active');
};

document.querySelector('#info-btn').onclick = () => {
    contactInfo.classList.add('active');
}

document.querySelector('#close-contact-info').onclick = () => {
    contactInfo.classList.remove('active');
}

window.onscroll = () => {
    navbar.classList.remove('active');
    searchForm.classList.remove('active');
    loginForm.classList.remove('active');
    contactInfo.classList.remove('active');
}

var homeSwiper = new Swiper(".home-slider", {
    loop: true,
    grabCursor: true,
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
});
homeSwiper.init();

document.getElementById("camera-btn").addEventListener("click", function () {
    window.location.href = "scan.html";
});

document.addEventListener("DOMContentLoaded", function () {
    const registrationForm = document.getElementById("registration-form");
    const passwordInput = document.getElementById("password");
    const confirmPasswordInput = document.getElementById("confirm-password");
    const successMessage = document.getElementById("success-message");

    registrationForm.addEventListener("submit", function (event) {
        event.preventDefault();

        const password = passwordInput.value;
        const confirmPassword = confirmPasswordInput.value;

        if (password !== confirmPassword) {
            alert("Password and confirm password do not match.");
        } else {
            successMessage.textContent = "Account created successfully!";
        }
    });
});

function searchOnGoogleMaps() {
    const pincode = document.getElementById('pincode').value;

    if (pincode.match(/^\d{6}$/)) {
        const googleMapsUrl = `https://www.google.com/maps/search/e+waste+facilities+in+${pincode}`;
        window.location.href = googleMapsUrl;
    } else {
        alert("Please enter a valid 6-digit pincode.");
    }
}
searchOnGoogleMaps.init();

//npm install eslint-plugin-react@latest --save-dev
//npx eslint "D:\vs folders\today\Src\js\app.js"

//npm install --save -dev jest
// npx jest "D:\vs folders\today\Src\js\app.js"

function captureImage() {
    var canvas = document.getElementById('canvas');
    var video = document.getElementById('camera-feed');
    var context = canvas.getContext('2d');

    context.drawImage(video, 0, 0, canvas.width, canvas.height);
    var imageDataUrl = canvas.toDataURL('image/jpeg');

    // Now you can do whatever you want with the image data URL
    console.log(imageDataUrl);
}