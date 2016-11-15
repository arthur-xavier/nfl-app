const Stadium = require('./Stadium');
const City = require('api/cities/City');

exports.all = function*() {
    let stadiums = yield this.database.query(`
        SELECT ${Stadium}, ${City.foreign}
        FROM stadium
        ${Stadium.joins}
        `);
    this.body = stadiums.map(Stadium);
};

exports.get = function*(id) {
    let [stadium] = yield this.database.query(`
        SELECT ${Stadium}, ${City.foreign}
        FROM stadium
        ${Stadium.joins}
        WHERE std_id='${id}'
        `);

    this.body = Stadium(stadium);
};
