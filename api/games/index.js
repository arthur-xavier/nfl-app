const Game = require('./Game');
const LIMIT = 100;

exports.all = function*() {
    let games = yield this.database.query(`
        SELECT ${Game}
        FROM game
        ${Game.joins}
        WHERE finished='1' AND home_score IS NOT NULL AND away_score IS NOT NULL
        ORDER BY start_time DESC
        LIMIT ${LIMIT}
        `);
    this.body = games.map(Game);
};

exports.get = function*(id) {
    let [game] = yield this.database.query(`
        SELECT ${Game}
        FROM game
        ${Game.joins}
        WHERE ${Game.key}='${id}'
        `);
    this.body = Game(game);
};
