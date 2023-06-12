const plugin = require('tailwindcss/plugin');
const buildMediaQuery = require('tailwindcss/lib/util/buildMediaQuery').default;

const extractConfig = plugin(({
    addVariant,
    theme
}) => {
    addVariant('fluyt-tailwind-extracted-config', ({ container }) => {
        let extractedConfig = '';

        Object.entries(theme('screens')).forEach(([key, value]) => {
            extractedConfig = `${extractedConfig} --breakpoints-${key}:'${buildMediaQuery(value)}';`;
        });

        (theme('fluyt.themes')).forEach((value) => {
            Object.entries(value).forEach(([key, value]) => {
                extractedConfig = `${extractedConfig} --themes-${key}:'${JSON.stringify(value)}';`;
            });
        });

        container.append(`
            .fluyt-tailwind-extracted-config {
                ${extractedConfig}
            }
        `);
    });
});

module.exports = extractConfig;
