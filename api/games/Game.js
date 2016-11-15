const Model = require('lib/model');
const Stadium = require('api/stadiums/Stadium');

const Game = new Model({
    id: 'gam_id',
    season: 'gam_season',
    type: 'gam_type',
    homeScore: 'gam_homescore',
    awayScore: 'gam_awayscore',
    attendance: 'gam_attendance',
    date: 'gam_date',
    stadium: Stadium,
});

Game.joins = 'INNER JOIN stadium ON gam_stdid=std_id';

module.exports = Game;
