const Team = require('./Team');
const City = require('api/cities/City');
const Stadium = require('api/stadiums/Stadium');

exports.all = function*() {
    let teams = yield this.database.query(`
        SELECT ${Team}, ${City.foreign}, ${Stadium.foreign}
        FROM team
        ${Team.joins}
        `);
    this.body = teams.map(Team);
};

exports.get = function*(id) {
    let [team] = yield this.database.query(`
        SELECT ${Team}, ${City.foreign}, ${Stadium.foreign}
        FROM team
        ${Team.joins}
        WHERE cit_id='${id}'
        `);
    this.body = Team(team);
};

exports.getPlayers = function*() {
    throw new Error('Not implemented yet.');
};
