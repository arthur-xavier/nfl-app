const Model = require('lib/model');

const Team = new Model({
    id: 'tea_id',
    name: 'tea_name',
    owner: 'tea_owner',
    year: 'tea_yearfoundation',
    city: 'cit_name',
    stadium: {
        name: 'std_name',
        capacity: 'std_capacity',
    },
});

Team.joins = `
    INNER JOIN city ON tea_citid=cit_id
    INNER JOIN stadium ON tea_stdid=std_id
    `;

module.exports = Team;
