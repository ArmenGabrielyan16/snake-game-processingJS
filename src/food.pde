/**
 * Represents food
 * @param {object} foodPropertiesObj - This contains the properties of food
 * @constructor Food
 */
let Food = function (foodPropertiesObj) {
    let distanceX = 2 * FOOD_DEFAULT_WIDTH;
    let distanceY = 2 * FOOD_DEFAULT_HEIGHT;

    while (true) {
        let randomX = getRandomInt(CLASSIC_BARRIER_WIDTH + distanceX, BOARD_WIDTH - CLASSIC_BARRIER_WIDTH - distanceX);
        let randomY = getRandomInt(CLASSIC_BARRIER_HEIGHT + distanceY, BOARD_HEIGHT - CLASSIC_BARRIER_HEIGHT - distanceY);

        if ((randomX < SNAKE_DEFAULT_X - SNAKE_DEFAULT_WIDTH || randomX > SNAKE_DEFAULT_X + 2 * SNAKE_DEFAULT_WIDTH) &&
            (randomY < SNAKE_DEFAULT_Y - SNAKE_DEFAULT_HEIGHT || randomY > SNAKE_DEFAULT_Y + 2 * SNAKE_DEFAULT_HEIGHT)) {
            break;
        }
    }

    this.x = foodPropertiesObj.x || randomX;
    this.y = foodPropertiesObj.y || randomY;
    this.width = foodPropertiesObj.width || FOOD_DEFAULT_WIDTH;
    this.height = foodPropertiesObj.height || FOOD_DEFAULT_HEIGHT;
    this.value = foodPropertiesObj.value || FOOD_DEFAULT_VALUE;
};

/**
 * Draws food on the canvas
 */
Food.prototype.draw = function () {
    fill(255, 0, 0);
    noStroke();
    rect(this.x, this.y, this.width, this.height);
};

/**
 * Makes the food to disappear
 */
Food.prototype.disappear = function () {
    fill(255, 255, 255);
    rect(this.x, this.y, this.width, this.height);
};