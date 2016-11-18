function Model(map) {
    let model = function(row) {
        return parseRowAsModel(row, map);
    };

    function toString(map) {
        return Object.keys(map)
            .map(k => typeof map[k] === 'object' ? toString(map[k]) : map[k])
            .join(', ');
    }
    model.toString = toString.bind(model, map);

    return model;
}

module.exports = Model;

function parseRowAsModel(row = {}, map) {
    let r = {};

    for (let key in map) {
        let value;
        switch (typeof map[key]) {
            case 'object':
                value = parseRowAsModel(row, map[key]);
                if (value && Object.keys(value).length !== 0) {
                    r[key] = value;
                }
                break;
            case 'string':
                value = row[map[key]] || row[key];
                if (value) {
                    r[key] = value;
                }
                break;
            default:
                throw new Error(`Invalid model mapping for ${key}: ${map[key]}`);
        }
    }

    return r;
}
