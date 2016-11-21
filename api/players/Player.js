const Model = require('lib/model');

const Player = new Model({
    id: 'player_id',
    name: 'full_name',
    number: 'uniform_number',
    birthdate: 'birthdate',
    position: 'position',
    height: 'height',
    weight: 'weight',
    team: {
        id: 'team',
        name: 'team.name AS team_name',
        city: 'team.city AS team_city',
    },
    college: 'college',
    profile: 'profile_url',
});

Player.key = 'player_id';

Player.joins = `
    INNER JOIN team team ON team_id=team
    `;

module.exports = Player;
