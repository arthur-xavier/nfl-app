const Model = require('lib/model');
const State = require('api/states/State');

const University = new Model({
    id: 'uni_id',
    name: 'uni_name',
    state: State,
});

University.joins = 'INNER JOIN state ON uni_staid=sta_id';

module.exports = University;
