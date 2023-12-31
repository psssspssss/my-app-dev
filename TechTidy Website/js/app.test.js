// app.test.js

// Import the functions or modules you want to test from app.js

const jsdom = require("jsdom");
const {
    JSDOM
} = jsdom;

const {
    searchOnGoogleMaps
} = require('./app');

// Mocking the window.location.href since Jest runs in a Node.js environment
delete window.location;
window.location = {
    href: ''
};

// Mocking the DOM elements
document.body.innerHTML = `
    <div class="contact-info"></div>
    <form id="registration-form">
        <input id="password" />
        <input id="confirm-password" />
        <div id="success-message"></div>
    </form>
    <input id="pincode" />
`;

// Import Jest's assertion library
const {
    test,
    expect
} = require('@jest/globals');

// Test suite for searchOnGoogleMaps function
describe('searchOnGoogleMaps', () => {
    test('should redirect to Google Maps with a valid pincode', () => {
        document.getElementById('pincode').value = '123456';
        searchOnGoogleMaps();
        expect(window.location.href).toBe('https://www.google.com/maps/search/e+waste+facilities+in+bangalore/@12.987587,77.600974,13z/data=!3m1!4b1!4m6!2m5!5m2!2ewaste!5sdevices!2s123456');
    });

    test('should show an alert for an invalid pincode', () => {
        document.getElementById('pincode').value = 'invalid';
        global.alert = jest.fn();
        searchOnGoogleMaps();
        expect(global.alert).toHaveBeenCalledWith('Please enter a valid 6-digit pincode.');
    });
});

// Test suite for registrationForm event listener
describe('registrationForm event listener', () => {
    test('should display success message for matching passwords', () => {
        document.getElementById('password').value = 'password';
        document.getElementById('confirm-password').value = 'password';
        document.getElementById('registration-form').submit();
        expect(document.getElementById('success-message').textContent).toBe('Account created successfully!');
    });

    test('should show an alert for mismatched passwords', () => {
        document.getElementById('password').value = 'password';
        document.getElementById('confirm-password').value = 'differentpassword';
        global.alert = jest.fn();
        document.getElementById('registration-form').submit();
        expect(global.alert).toHaveBeenCalledWith('Password and confirm password do not match.');
    });
});