const State = require('./State');
const City = require('api/cities/City');
const Stadium = require('api/stadiums/Stadium');
const Team = require('api/teams/Team');

exports.all = function*() {
    let states = yield this.database.query(`
        SELECT ${State}
        FROM state
        `);
    this.body = states.map(State);
};

exports.get = function*(id) {
    let [state] = yield this.database.query(`
        SELECT ${State}
        FROM state
        WHERE sta_id='${id}'
        `);

    let cities = yield this.database.query(`
        SELECT ${City}
        FROM city
        WHERE cit_staid='${id}'
        `);

    let stadiums = yield this.database.query(`
        SELECT ${Stadium}
        FROM stadium
        WHERE std_citid IN (SELECT cit_id FROM city WHERE cit_staid='${id}')
        `);

    let teams = yield this.database.query(`
        SELECT ${Team}
        FROM team
        WHERE tea_citid IN (SELECT cit_id FROM city WHERE cit_staid='${id}')
        `);

    this.body = state ? Object.assign(state, { cities, stadiums, teams }) : {};
};
