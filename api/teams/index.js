const Team = require('./Team');
const LIMIT = 100;

exports.all = function*() {
    let teams = yield this.database.query(`
        SELECT ${Team}
        FROM team
        LIMIT ${LIMIT}
        `);
    this.body = teams.map(Team);
};

exports.get = function*(id) {
    let [team] = yield this.database.query(`
        SELECT ${Team}
        FROM team
        WHERE ${Team.key}='${id}'
        `);

    let players = yield this.database.query(`
        SELECT player_id, full_name, uniform_number
        FROM player
        WHERE team='${id}'
        `);

    let response = Team(team);
    response.players = players.map(p => ({
        id: p.player_id,
        name: p.full_name,
        number: p.uniform_number,
    }));

    this.body = response;
};
