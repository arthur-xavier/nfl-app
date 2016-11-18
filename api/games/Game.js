const Model = require('lib/model');

const Game = new Model({
    id: 'gam_id',
    season: 'gam_season',
    type: 'gam_type',
    homeScore: 'gam_homescore',
    awayScore: 'gam_awayscore',
    attendance: 'gam_attendance',
    date: 'gam_date',
    stadium: {
        name: 'std_name',
        capacity: 'std_capacity',
        city: 'cit_name',
    }
});

Game.joins = `
    INNER JOIN stadium ON gam_stdid=std_id
    INNER JOIN city ON std_citid=cit_id
    `;

module.exports = Game;
