const Model = require('lib/model');
const State = require('api/states/State');

const City = new Model({
    id: 'cit_id',
    name: 'cit_name',
    state: State,
});

City.joins = 'INNER JOIN state ON cit_staid=sta_id';

module.exports = City;

