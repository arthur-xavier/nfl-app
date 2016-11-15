process.env.NODE_PATH = __dirname;
require('module').Module._initPaths();

const Koa = require('koa');
const Database = require('lib/database');
const Logger = require('koa-logger');
const Static = require('koa-static');

const load = require('lib/load');
const path = require('path');

let app = Koa();

app.use(Logger());
app.use(Static(path.join(__dirname, '/public/dist')));
app.use(Database({
    driver: 'mysql',
    user: 'root',
    password: 'root',
    host: 'localhost',
    database: 'nfldb',
}));

load(app, './api');

app.listen(3000);
console.info('Listening...'); // eslint-disable-line no-console
