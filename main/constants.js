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
const FOOD_DEFAULT_HITS = 0;
const BOARD_MARGIN_ERROR_X = -8;
const BOARD_MARGIN_ERROR_Y = -3;
const KEY_CODE_A = 97;
const KEY_CODE_W = 115;
const KEY_CODE_D = 100;
const KEY_CODE_S = 119;