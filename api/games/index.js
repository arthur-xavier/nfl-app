const Game = require('./Game');

exports.all = function*() {
    let games = yield this.database.query(`
        SELECT ${Game}
        FROM game
        ${Game.joins}
        `);
    this.body = games.map(Game);
};

exports.get = function*(id) {
    let [game] = yield this.database.query(`
        SELECT ${Game}
        FROM game
        ${Game.joins}
        WHERE gam_id='${id}'
        `);
    this.body = Game(game);
};

exports.getStats = function*() {
    throw new Error('Not implemented yet.');
};

exports.getOffensiveStats = function*() {
    throw new Error('Not implemented yet.');
};

exports.getDefensiveStats = function*() {
    throw new Error('Not implemented yet.');
};

exports.getSpecialStats = function*() {
    throw new Error('Not implemented yet.');
};
