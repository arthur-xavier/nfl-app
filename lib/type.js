module.exports = function(ctors) {
    for (let name in ctors) {
        let params = ctors[name];
        let ctor = function(...args) {
            if (!(this instanceof ctor)) {
                return new ctor(...args);
            }
            for (let i in args) {
                this[params[i]] = args[i];
            }
        };
        ctors[name] = ctor;
    }

    return ctors;
};
