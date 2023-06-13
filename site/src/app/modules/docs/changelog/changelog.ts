import { ChangeDetectionStrategy, Component } from '@angular/core';

@Component({
    selector: 'changelog',
    templateUrl: './changelog.html',
    changeDetection: ChangeDetectionStrategy.OnPush
})
export class ChangelogComponent {
    changelog: any[] = [

        // TODO: fazer buscar da api do GItHUb
        {
            version: '0.0.1',
            releaseDate: 'Fake jan 16, 2023',
            changes: [
                {
                    type: 'Added',
                    list: [
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        'Mauris id nulla cursus, cursus nisl non, egestas dolor.',
                        'Nunc eu libero a justo vulputate consectetur.',
                        'Curabitur quis elit non urna blandit aliquet vel ut sapien.',
                        'Donec laoreet velit eu finibus faucibus.',
                    ]
                },
                {
                    type: 'Changed',
                    list: [
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        'Mauris id nulla cursus, cursus nisl non, egestas dolor.',
                        'Nunc eu libero a justo vulputate consectetur.',
                        'Curabitur quis elit non urna blandit aliquet vel ut sapien.',
                        'Donec laoreet velit eu finibus faucibus.',
                    ]
                }
            ]
        }
    ];
}
