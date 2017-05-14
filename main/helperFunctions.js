/**
 * Returns random integer between min and max inclusive
 * @param {number} min - This is the minimum bound
 * @param {number} max - This is the maximum bound
 * @returns {int}
 */
function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1)) + min;
}