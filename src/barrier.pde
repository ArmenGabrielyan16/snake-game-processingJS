/**
 * Represents barrier
 * @param {object} barrierPropertiesObj - This contains the properties of barrier
 * @constructor Barrier
 */
let Barrier = function (barrierPropertiesObj) {
    this.x = barrierPropertiesObj.x;
    this.y = barrierPropertiesObj.y;
    this.width = barrierPropertiesObj.width || CLASSIC_BARRIER_WIDTH;
    this.height = barrierPropertiesObj.height || CLASSIC_BARRIER_HEIGHT;
};

/**
 * Draws barrier on the canvas
 */
Barrier.prototype.draw = function () {
    fill(0, 0, 0);
    rect(this.x, this.y, this.width, this.height);
};