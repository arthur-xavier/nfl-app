function Model(map) {
    let model = function(m = {}) {
        let r = {};

        for (let key in map) {
            let value;
            switch (typeof map[key]) {
                case 'function':
                    value = map[key](m);
                    if (Object.keys(value).length !== 0) {
                        r[key] = value;
                    }
                    break;
                case 'string':
                    value = m[map[key]] || m[key];
                    if (value) {
                        r[key] = value;
                    }
                    break;
                default:
                    throw new Error(`Invalid model mapping for ${key}: ${map[key]}`);
            }
        }

        return r;
    };

    model.foreign = Object.keys(map)
        .map(key => map[key])
        .filter(t => typeof t === 'string')
        .join(', ');

    model.toString = function() {
        return Object.keys(map)
            .filter(key => typeof map[key] === 'string')
            .map(key => `${map[key]} AS ${key}`)
            .join(', ');
    };

    return model;
}

module.exports = Model;
