const City = require('./City');
const State = require('api/states/State');
const Stadium = require('api/stadiums/Stadium');
const Team = require('api/teams/Team');

exports.all = function*() {
    let cities = yield this.database.query(`
        SELECT ${City}, ${State.foreign}
        FROM city
        ${City.joins}
        `);
    this.body = cities.map(City);
};

exports.get = function*(id) {
    let [city] = yield this.database.query(`
        SELECT ${City}, ${State.foreign}
        FROM city
        ${City.joins}
        WHERE cit_id='${id}'
        `);
    this.body = City(city);
};

exports.getTeams = function*(id) {
    let teams = yield this.database.query(`
        SELECT ${Team}, ${City.foreign}, ${Stadium.foreign}, ${State.foreign}
        FROM team
        ${Team.joins}
        ${City.joins}
        WHERE tea_citid='${id}'
        `);
    console.log(teams, teams.map(Team));
    this.body = teams.map(Team);
};
