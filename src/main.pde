/**
 * Sets up the setting for the program
 */
let setup = function () {
    size(BOARD_WIDTH, BOARD_HEIGHT);
    background(0, 0);
};

/**
 * Represents snake
 * @param {object} snakePropertiesObj
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
 * Checks if the snake hits the barrier
 */
Snake.prototype.checkForBarrierHit = function () {
    if (this.x <= CLASSIC_BARRIER_WIDTH || this.x >= BOARD_WIDTH - CLASSIC_BARRIER_WIDTH + 2 * BOARD_MARGIN_ERROR_X ||
        this.y <= CLASSIC_BARRIER_HEIGHT || this.y >= BOARD_HEIGHT - CLASSIC_BARRIER_HEIGHT + 5 * BOARD_MARGIN_ERROR_Y) {
        alert("GAME OVER");
        location.reload();
        start()
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

/**
 * Draws barrier around the canvas - Classic Barrier
 */
drawClassicBarrier = function () {
    for (let i = 0;i < BOARD_WIDTH;i += CLASSIC_BARRIER_WIDTH) {
        for (let j = 0;j < BOARD_HEIGHT;j += CLASSIC_BARRIER_HEIGHT) {
            let marginErrorX, marginErrorY;

            if (i == 0 || j == 0) {
                marginErrorX = 0;
                marginErrorY = 0;
            }

            if (i > BOARD_WIDTH - CLASSIC_BARRIER_WIDTH) {
                marginErrorX = BOARD_MARGIN_ERROR_X;
                marginErrorY = 0;
            }

            if (j > BOARD_HEIGHT - CLASSIC_BARRIER_HEIGHT) {
                marginErrorX = 0;
                marginErrorY = BOARD_MARGIN_ERROR_Y;
            }

            if (i == 0 || j == 0 || i > BOARD_WIDTH - CLASSIC_BARRIER_WIDTH || j > BOARD_HEIGHT - CLASSIC_BARRIER_HEIGHT) {
                new Barrier({
                    x: i + marginErrorX,
                    y: j + marginErrorY
                }).draw();
            }
        }
    }
};

/**
 * Represents food
 * @param {object} foodPropertiesObj - This contains the properties of food
 * @constructor Food
 */
let Food = function (foodPropertiesObj) {
    this.x = foodPropertiesObj.x;
    this.y = foodPropertiesObj.y;
    this.width = foodPropertiesObj.width || FOOD_DEFAULT_WIDTH;
    this.height = foodPropertiesObj.height || FOOD_DEFAULT_HEIGHT;
};

/**
 * Draws food on the canvas
 */
Food.prototype.draw = function () {
    fill(255, 0, 0);
    rect(this.x, this.y, this.width, this.height);
};

/**
 * Starts the program
 */
let start = function () {
    setup();
    drawClassicBarrier();

    let snake = new Snake({});
    snake.draw();
    mouseMoved = function () {
        snake.disappear();
        if (mouseX - pmouseX > 0) {
            snake.moveRight();
        } else if (mouseX - pmouseX < 0) {
            snake.moveLeft();
        } else if (mouseY - pmouseY > 0) {
            snake.moveUp();
        } else if (mouseY - pmouseY < 0) {
            snake.moveDown();
        }
        snake.checkForBarrierHit();
        snake.draw();
    };
};

start();