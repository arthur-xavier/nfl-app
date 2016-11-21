const Model = require('lib/model');

const Team = new Model({
    id: 'team_id',
    name: 'name',
    city: 'city',
});

Team.key = 'team_id';

module.exports = Team;
