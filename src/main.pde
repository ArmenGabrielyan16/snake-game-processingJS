/**
 * Sets up the setting for the program
 */
let setup = function () {
    size(BOARD_WIDTH, BOARD_HEIGHT);
    background(0, 0);
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
 * Starts the program
 */
let start = function () {
    setup();
    drawClassicBarrier();

    let food = new Food({});
    food.draw();

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

        snake.checkForClassicBarrierHit();
        snake.draw();
        snake.checkForFoodEat(food);
    };
};

start();