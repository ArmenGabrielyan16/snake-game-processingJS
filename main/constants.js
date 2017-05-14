const WIDTH = window.innerWidth
    || document.documentElement.clientWidth
    || document.body.clientWidth;

const HEIGHT = window.innerHeight
    || document.documentElement.clientHeight
    || document.body.clientHeight;
const BOARD_WIDTH = WIDTH / 3;
const BOARD_HEIGHT = HEIGHT / 3;
const SNAKE_DEFAULT_X = BOARD_WIDTH / 2;
const SNAKE_DEFAULT_Y = BOARD_HEIGHT / 2;
const SNAKE_DEFAULT_WIDTH = 15;
const SNAKE_DEFAULT_HEIGHT = 15;
const SNAKE_MOVE_SPEED = 2;
const CLASSIC_BARRIER_WIDTH = 20;
const CLASSIC_BARRIER_HEIGHT = 20;
const FOOD_DEFAULT_WIDTH = 10;
const FOOD_DEFAULT_HEIGHT = 10;
const FOOD_DEFAULT_VALUE = 1;
const BOARD_MARGIN_ERROR_X = -8;
const BOARD_MARGIN_ERROR_Y = -3;