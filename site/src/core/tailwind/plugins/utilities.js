const plugin = require('tailwindcss/plugin');

const utilities = plugin(({
    addComponents
}) =>
{
    /*
    * Add base components. These are very important for everything to look
    * correct. We are adding these to the 'components' layer because they must
    * be defined before pretty much everything else.
    */
    addComponents(
        {
            '.mat-icon'       : {
                '--tw-text-opacity': '1',
                color              : 'rgba(var(--fluyt-mat-icon-rgb), var(--tw-text-opacity))'
            },
            '.text-default'   : {
                '--tw-text-opacity': '1 !important',
                color              : 'rgba(var(--fluyt-text-default-rgb), var(--tw-text-opacity)) !important'
            },
            '.text-secondary' : {
                '--tw-text-opacity': '1 !important',
                color              : 'rgba(var(--fluyt-text-secondary-rgb), var(--tw-text-opacity)) !important'
            },
            '.text-hint'      : {
                '--tw-text-opacity': '1 !important',
                color              : 'rgba(var(--fluyt-text-hint-rgb), var(--tw-text-opacity)) !important'
            },
            '.text-disabled'  : {
                '--tw-text-opacity': '1 !important',
                color              : 'rgba(var(--fluyt-text-disabled-rgb), var(--tw-text-opacity)) !important'
            },
            '.divider'        : {
                color: 'var(--fluyt-divider) !important'
            },
            '.bg-card'        : {
                '--tw-bg-opacity': '1 !important',
                backgroundColor  : 'rgba(var(--fluyt-bg-card-rgb), var(--tw-bg-opacity)) !important'
            },
            '.bg-default'     : {
                '--tw-bg-opacity': '1 !important',
                backgroundColor  : 'rgba(var(--fluyt-bg-default-rgb), var(--tw-bg-opacity)) !important'
            },
            '.bg-dialog'      : {
                '--tw-bg-opacity': '1 !important',
                backgroundColor  : 'rgba(var(--fluyt-bg-dialog-rgb), var(--tw-bg-opacity)) !important'
            },
            '.ring-bg-default': {
                '--tw-ring-opacity': '1 !important',
                '--tw-ring-color'  : 'rgba(var(--fluyt-bg-default-rgb), var(--tw-ring-opacity)) !important'
            },
            '.ring-bg-card'   : {
                '--tw-ring-opacity': '1 !important',
                '--tw-ring-color'  : 'rgba(var(--fluyt-bg-card-rgb), var(--tw-ring-opacity)) !important'
            }
        },
        {
            variants: ['dark', 'responsive', 'group-hover', 'hover']
        }
    );

    addComponents(
        {
            '.bg-hover': {
                backgroundColor: 'var(--fluyt-bg-hover) !important'
            }
        },
        {
            variants: ['dark', 'group-hover', 'hover']
        }
    );
});

module.exports = utilities;
