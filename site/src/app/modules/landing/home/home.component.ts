import { Component, ViewEncapsulation } from '@angular/core';

@Component({
    selector: 'landing-home',
    templateUrl: './home.component.html',
    encapsulation: ViewEncapsulation.None
})
export class LandingHomeComponent {

    public openGitHub(): void {
        window.open('https://github.com/fluytcloud/fluyt', '_blank');
    }
 }
