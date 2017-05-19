/**
 * Sets up the setting for the program
 */
let setup = function () {
    size(BOARD_WIDTH, BOARD_HEIGHT);
    background(0, 0);

    canvas.style.left = WIDTH / 3 + 'px';
    canvas.style.top = HEIGHT / 3 + 'px';
    canvas.style.position = "absolute";

    canvasScoreline.style.width = BOARD_WIDTH + 'px';
    canvasScoreline.style.height = BOARD_HEIGHT + 'px';
    canvasScoreline.style.left = WIDTH / 3 + 'px';
    canvasScoreline.style.top = HEIGHT / 3 + BOARD_HEIGHT + 'px';
    canvasScoreline.style.position = 'absolute';
};

/**
 * Draws scoreline on the canvas
 * @param {Snake} snake - This is a Snake object
 */
let drawScoreline = function (snake) {
    let context = canvasScoreline.getContext('2d');

    if (snake.score > 0) {
        context.clearRect(0, 0, BOARD_WIDTH, BOARD_HEIGHT);
        console.log(snake.score);
    }

    context.font = '14px Times New Roman';
    context.fillText(SCORE_DEFAULT_LABEL + '  ' + snake.score, 0, 20);
};

/**
 * Starts the program
 * @param {Snake} snake - This is the snake on the canvas
 */
let start = function (snake) {
    setup();
    drawClassicBarrier();
    drawScoreline(snake);

    let food = new Food({});
    food.draw();

    snake.draw();

    document.onkeypress = function(event) {
        snake.disappear();

        event = event || window.event;
        let keyCode = event.keyCode || event.which;

        switch (keyCode) {
            case KEY_CODE_A: snake.moveLeft();
            break;
            case KEY_CODE_W: snake.moveUp();
            break;
            case KEY_CODE_D: snake.moveRight();
            break;
            case KEY_CODE_S: snake.moveDown()
        }

        snake.checkForClassicBarrierHit();
        snake.draw();
        snake.checkForFoodEat(food);
    };
};

start(new Snake({}));