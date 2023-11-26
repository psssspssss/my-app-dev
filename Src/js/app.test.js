// app.test.js
const {
    searchOnGoogleMaps
} = require('./app');

test('generates Google Maps URL with valid pincode', () => {
    const pincode = '123456';
    const googleMapsUrl = searchOnGoogleMaps(pincode);

    const expectedUrl = 'https://www.google.com/maps/search/e+waste+facilities+in+123456';
    expect(googleMapsUrl).toBe(expectedUrl);
});

test('does not generate Google Maps URL with invalid pincode', () => {
    const pincode = 'abc123'; // Invalid pincode
    const googleMapsUrl = searchOnGoogleMaps(pincode);

    // Ensure that the function returns null or some other expected value for invalid input
    expect(googleMapsUrl).toBeNull();
});