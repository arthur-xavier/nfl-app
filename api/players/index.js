const Player = require('./Player');

exports.all = function*() {
    let players = yield this.database.query(`
        SELECT ${Player}
        FROM player
        ${Player.joins}
        `);
    this.body = players.map(Player);
};

exports.get = function*(id) {
    let [player] = yield this.database.query(`
        SELECT ${Player}
        FROM player
        ${Player.joins}
        WHERE cit_id='${id}'
        `);
    this.body = Player(player);
};

exports.getStats = function*() {
    throw new Error('Not implemented yet.');
};

exports.getStatsForGame = function*() {
    throw new Error('Not implemented yet.');
};

exports.getOffensiveStats = function*() {
    throw new Error('Not implemented yet.');
};

exports.getOffensiveStatsForGame = function*() {
    throw new Error('Not implemented yet.');
};

exports.getDefensiveStats = function*() {
    throw new Error('Not implemented yet.');
};

exports.getDefensiveStatsForGame = function*() {
    throw new Error('Not implemented yet.');
};

exports.getSpecialStats = function*() {
    throw new Error('Not implemented yet.');
};

exports.getSpecialStatsForGame = function*() {
    throw new Error('Not implemented yet.');
};
