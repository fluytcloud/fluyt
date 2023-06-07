/* eslint-disable */
import { FluytNavigationItem } from 'core/components/navigation';

export const defaultNavigation: FluytNavigationItem[] = [
    {
        id: 'divider-1',
        type: 'divider'
    },
    {
        id: 'about',
        title: 'What is Fluyt Cloud?',
        type: 'basic',
        link: 'home',
        children: []
    },
    {
        id: 'documentation',
        title: 'Documentation',
        type: 'group',
        children: [
            {
                id: 'documentation.changelog',
                title: 'Changelog',
                type: 'basic',
                icon: 'heroicons_outline:speakerphone',
                link: '/docs/changelog',
                badge: {
                    title: '13.6.2',
                    classes: 'px-2 bg-yellow-300 text-black rounded-full'
                }
            },
            {
                id: 'documentation.guides',
                title: 'Guides',
                type: 'basic',
                icon: 'heroicons_outline:book-open',
                link: '/docs/guides'
            }
        ]
    },
    {
        id: 'community',
        title: 'Community',
        type: 'basic',
        children: []
    }, {
        id: 'blog',
        title: 'Blog',
        type: 'basic',
        children: []
    }
];

export const horizontalNavigation: FluytNavigationItem[] = [
    {
        id: 'about',
        title: 'What is Fluyt Cloud?',
        type: 'basic',
        link: 'home',
        children: []
    },
    {
        id: 'documentation',
        title: 'Documentation',
        type: 'group',
        children: [
            {
                id: 'documentation.changelog',
                title: 'Changelog',
                type: 'basic',
                icon: 'heroicons_outline:speakerphone',
                link: '/docs/changelog',
                badge: {
                    title: '13.6.2',
                    classes: 'px-2 bg-yellow-300 text-black rounded-full'
                }
            },
            {
                id: 'documentation.guides',
                title: 'Guides',
                type: 'basic',
                icon: 'heroicons_outline:book-open',
                link: '/docs/guides'
            }
        ]
    },
    {
        id: 'community',
        title: 'Community',
        type: 'basic',
        children: []
    }, {
        id: 'blog',
        title: 'Blog',
        type: 'basic',
        children: []
    }
];
