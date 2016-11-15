const Model = require('lib/model');
const City = require('api/cities/City');
const University = require('api/universities/University');

const Player = new Model({
    id: 'pla_id',
    name: 'pla_name',
    birthdate: 'pla_dob',
    position: 'pla_position',
    height: 'pla_height',
    weight: 'pla_weight',
    city: City,
    university: University,
});

Player.joins = 'INNER JOIN city ON pla_citid=cit_id INNER JOIN university ON pla_uniid=uni_id';

module.exports = Player;
