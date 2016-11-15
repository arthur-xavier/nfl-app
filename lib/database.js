const anydb = require('any-db');

class Database {

    constructor({ driver, user, password, host, database }) {
        this._db = anydb.createConnection(`${driver}://${user}:${password}@${host}/${database}`);
    }

    query(query, params) {
        return (callback) => {
            console.log(`  <-> QUERY '${query}' ${params ? 'with params ' + params : ''}`); // eslint-disable-line no-console
            this._db.query(query, params, (err, res) => callback(err, res.rows));
        };
    }
}

module.exports = function(config) {
    return function* database(next) {
        this.database = new Database(config);
        yield next;
    };
};
