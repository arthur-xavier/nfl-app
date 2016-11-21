process.env.NODE_PATH = __dirname;
require('module').Module._initPaths();

const Koa = require('koa');
const Cors = require('kcors');
const Database = require('lib/database');
const Logger = require('koa-logger');
const Static = require('koa-static');

const load = require('lib/load');
const path = require('path');

let app = Koa();

app.use(Logger());
app.use(Static(path.join(__dirname, '/public/dist')));
app.use(Cors());
app.use(Database(require('db.json')));

load(app, './api');

app.listen(8080);
console.info('Listening...'); // eslint-disable-line no-console
