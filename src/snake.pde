/**
 * Represents snake
 * @param {object} snakePropertiesObj - This contains the properties of snake
 * @constructor Snake
 */
let Snake = function (snakePropertiesObj) {
    this.x = snakePropertiesObj.x || SNAKE_DEFAULT_X;
    this.y = snakePropertiesObj.y || SNAKE_DEFAULT_Y;
    this.width = snakePropertiesObj.width || SNAKE_DEFAULT_WIDTH;
    this.height = snakePropertiesObj.height || SNAKE_DEFAULT_HEIGHT;
    this.score = 0;
};

/**
 * Draws snake on the canvas
 */
Snake.prototype.draw = function () {
    fill(90, 245, 65);
    noStroke();
    rect(this.x, this.y, this.width, this.height);
};

/**
 * Makes the snake to disappear
 */
Snake.prototype.disappear = function () {
    fill(255, 255, 255);
    rect(this.x, this.y, this.width, this.height);
};

/**
 * Checks if the snake hits the classic barrier
 */
Snake.prototype.checkForClassicBarrierHit = function () {
    if (this.x <= CLASSIC_BARRIER_WIDTH || this.x >= BOARD_WIDTH - CLASSIC_BARRIER_WIDTH + 2 * BOARD_MARGIN_ERROR_X ||
        this.y <= CLASSIC_BARRIER_HEIGHT || this.y >= BOARD_HEIGHT - CLASSIC_BARRIER_HEIGHT + 5 * BOARD_MARGIN_ERROR_Y) {
        alert("GAME OVER");
        location.reload();
        start(new Snake({}));
    }
};

/**
 * Checks if the snake eats the food
 * @param {Food} food - This is instance of Food
 */
Snake.prototype.checkForFoodEat = function (food) {
    if (food.hits === 0) {
        if ((this.x >= food.x || this.x + SNAKE_DEFAULT_WIDTH >= food.x) && this.x <= food.x + FOOD_DEFAULT_WIDTH &&
            (this.y >= food.y || this.y + SNAKE_DEFAULT_HEIGHT >= food.y) && this.y <= food.y + FOOD_DEFAULT_HEIGHT) {
            food.disappear();
            food.hits = 1;

            let newFood = new Food({});
            newFood.draw();

            this.score += food.value;
            start(this);
        }
    }
};

/**
 * Moves the snake rightwards
 */
Snake.prototype.moveRight = function () {
    this.x += SNAKE_MOVE_SPEED;
};

/**
 * Moves the snake leftwards
 */
Snake.prototype.moveLeft = function () {
    this.x -= SNAKE_MOVE_SPEED;
};

/**
 * Moves the snake upwards
 */
Snake.prototype.moveUp = function () {
    this.y += SNAKE_MOVE_SPEED;
};

/**
 * Moves the snake downwards
 */
Snake.prototype.moveDown = function () {
    this.y -= SNAKE_MOVE_SPEED;
};