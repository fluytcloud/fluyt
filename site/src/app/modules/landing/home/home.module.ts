import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { LandingHomeComponent } from 'app/modules/landing/home/home.component';
import { landingHomeRoutes } from 'app/modules/landing/home/home.routing';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

@NgModule({
    declarations: [
        LandingHomeComponent
    ],
    imports: [
        RouterModule.forChild(landingHomeRoutes),
        MatButtonModule,
        MatIconModule,
        CommonModule,
    ]
})
export class LandingHomeModule {
}
