const Player = require('./Player');
const LIMIT = 100;

exports.all = function*() {
    let players = yield this.database.query(`
        SELECT ${Player}
        FROM player
        ${Player.joins}
        WHERE team<>'UNK' AND status<>'Unknown'
        LIMIT ${LIMIT}
        `);
    this.body = players.map(Player);
};

exports.get = function*(id) {
    let [player] = yield this.database.query(`
        SELECT ${Player}
        FROM player
        ${Player.joins}
        WHERE ${Player.key}='${id}'
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
