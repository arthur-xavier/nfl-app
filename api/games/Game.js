const Model = require('lib/model');

const Game = new Model({
    id: 'gsis_id',
    season: {
        year: 'season_year',
        type: 'season_type',
    },
    startTime: 'start_time',
    home: {
        team: {
            id: 'home_team',
            name: 'home.name AS home_name',
            city: 'home.city AS home_city',
        },
        score: 'home_score',
    },
    away: {
        team: {
            id: 'away_team',
            name: 'away.name AS away_name',
            city: 'away.city AS away_city',
        },
        score: 'away_score',
    },
});

Game.key = 'gsis_id';

Game.joins = `
    INNER JOIN team home ON home.team_id=home_team
    INNER JOIN team away ON away.team_id=away_team
    `;

module.exports = Game;
