const Route = require('koa-route');
const fs = require('fs');
const path = require('path');

const API_JSON = 'api.json';

//
module.exports = function(app, root) {

    fs.readdirSync(root)
        .forEach(file => {
            let directory = path.resolve(root, file);
            let stats = fs.lstatSync(directory);

            if (stats.isDirectory()) {
                let api = require(`${directory}/${API_JSON}`);
                api.directory = directory;
                api.file = file;
                route(app, api);
            }
        });
};

function route(app, { directory, file, routes }) {
    console.info(`Generating routes for ${file}`); // eslint-disable-line no-console

    let mod = require(directory);

    for (let key in routes) {
        let [method, path] = key.split(' ');
        let fnName = routes[key];
        console.info(`${method} ${path} -> ${fnName}`); // eslint-disable-line no-console

        let fn = mod[fnName];
        if (!fn) throw new Error(`load: method ${fnName} is not defined for API '${file}'.`);

        app.use(Route[method.toLowerCase()](path, fn));
    }
}
