const Model = require('lib/model');
const City = require('api/cities/City');
const Stadium = require('api/stadiums/Stadium');

const Team = new Model({
    id: 'tea_id',
    name: 'tea_name',
    owner: 'tea_owner',
    year: 'tea_yearfoundation',
    stadium: Stadium,
    city: City,
});

Team.joins = 'INNER JOIN city ON tea_citid=cit_id INNER JOIN stadium ON tea_stdid=std_id';

module.exports = Team;
