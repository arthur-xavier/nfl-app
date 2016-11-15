const University = require('./University');
const State = require('api/states/State');

exports.all = function*() {
    let universities = yield this.database.query(`
        SELECT ${University}, ${State.foreign}
        FROM university
        ${University.joins}
        `);
    this.body = universities.map(University);
};

exports.get = function*(id) {
    let [university] = yield this.database.query(`
        SELECT ${University}, ${State.foreign}
        FROM university
        ${University.joins}
        WHERE uni_id='${id}'
        `);
    this.body = University(university);
};
