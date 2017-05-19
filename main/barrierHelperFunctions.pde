/**
 * Draws barrier around the canvas - Classic Barrier
 */
let drawClassicBarrier = function () {
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