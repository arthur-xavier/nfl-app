const Team = require('./Team');

exports.all = function*() {
    let teams = yield this.database.query(`
        SELECT ${Team}
        FROM team
        ${Team.joins}
        `);
    this.body = teams.map(Team);
};

exports.get = function*(id) {
    let [team] = yield this.database.query(`
        SELECT ${Team}
        FROM team
        ${Team.joins}
        WHERE cit_id='${id}'
        `);
    this.body = Team(team);
};

exports.getPlayers = function*() {
    throw new Error('Not implemented yet.');
};
