const Model = require('lib/model');
const City = require('api/cities/City');

const Stadium = new Model({
    id: 'std_id',
    name: 'std_name',
    capacity: 'std_capacity',
    city: City,
});

Stadium.joins = 'INNER JOIN city ON std_citid=cit_id';

module.exports = Stadium;
