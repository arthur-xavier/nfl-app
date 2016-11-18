const Model = require('lib/model');

const Player = new Model({
    id: 'pla_id',
    name: 'pla_name',
    birthdate: 'pla_dob',
    position: 'pla_position',
    height: 'pla_height',
    weight: 'pla_weight',
    team: {
        id: 'tea_id',
        name: 'tea_name',
    },
    city: 'cit_name',
    university: 'uni_name',
});

Player.joins = `
    INNER JOIN city ON pla_citid=cit_id
    INNER JOIN university ON pla_uniid=uni_id
    INNER JOIN player_team ON plt_plaid=pla_id
    INNER JOIN team ON tea_id=plt_teaid
    `;

module.exports = Player;
