const Game = require('./Game');
const Stadium = require('api/stadiums/Stadium');

exports.all = function*() {
    let players = yield this.database.query(`
        SELECT ${Game}, ${Stadium.foreign}
        FROM game
        ${Game.joins}
        `);
    this.body = players.map(Game);
};

exports.get = function*(id) {
    let [player] = yield this.database.query(`
        SELECT ${Game}, ${Stadium.foreign}
        FROM game
        ${Game.joins}
        WHERE gam_id='${id}'
        `);
    this.body = Game(player);
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
