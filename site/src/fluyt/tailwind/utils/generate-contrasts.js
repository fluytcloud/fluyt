const chroma = require('chroma-js');
const _ = require('lodash');

const generateContrasts = (palette) => {
    const lightColor = '#FFFFFF';
    let darkColor = '#FFFFFF';

    _.forEach(palette, ((color) => {
        darkColor = chroma.contrast(color, '#FFFFFF') > chroma.contrast(darkColor, '#FFFFFF') ? color : darkColor;
    }));


    return _.fromPairs(_.map(palette, ((color, hue) => [
        hue,
        chroma.contrast(color, darkColor) > chroma.contrast(color, lightColor) ? darkColor : lightColor
    ]
    )));
};

module.exports = generateContrasts;
