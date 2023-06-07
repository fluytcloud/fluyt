import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { MatButtonModule } from '@angular/material/button';
import { MatDividerModule } from '@angular/material/divider';
import { MatIconModule } from '@angular/material/icon';
import { MatMenuModule } from '@angular/material/menu';
import { MatTooltipModule } from '@angular/material/tooltip';
import { FluytScrollbarModule } from 'core/directives/scrollbar/public-api';
import { FluytHorizontalNavigationBasicItemComponent } from 'core/components/navigation/horizontal/components/basic/basic.component';
import { FluytHorizontalNavigationBranchItemComponent } from 'core/components/navigation/horizontal/components/branch/branch.component';
import { FluytHorizontalNavigationDividerItemComponent } from 'core/components/navigation/horizontal/components/divider/divider.component';
import { FluytHorizontalNavigationSpacerItemComponent } from 'core/components/navigation/horizontal/components/spacer/spacer.component';
import { FluytHorizontalNavigationComponent } from 'core/components/navigation/horizontal/horizontal.component';
import { FluytVerticalNavigationAsideItemComponent } from 'core/components/navigation/vertical/components/aside/aside.component';
import { FluytVerticalNavigationBasicItemComponent } from 'core/components/navigation/vertical/components/basic/basic.component';
import { FluytVerticalNavigationCollapsableItemComponent } from 'core/components/navigation/vertical/components/collapsable/collapsable.component';
import { FluytVerticalNavigationDividerItemComponent } from 'core/components/navigation/vertical/components/divider/divider.component';
import { FluytVerticalNavigationGroupItemComponent } from 'core/components/navigation/vertical/components/group/group.component';
import { FluytVerticalNavigationSpacerItemComponent } from 'core/components/navigation/vertical/components/spacer/spacer.component';
import { FluytVerticalNavigationComponent } from 'core/components/navigation/vertical/vertical.component';

@NgModule({
    declarations: [
        FluytHorizontalNavigationBasicItemComponent,
        FluytHorizontalNavigationBranchItemComponent,
        FluytHorizontalNavigationDividerItemComponent,
        FluytHorizontalNavigationSpacerItemComponent,
        FluytHorizontalNavigationComponent,
        FluytVerticalNavigationAsideItemComponent,
        FluytVerticalNavigationBasicItemComponent,
        FluytVerticalNavigationCollapsableItemComponent,
        FluytVerticalNavigationDividerItemComponent,
        FluytVerticalNavigationGroupItemComponent,
        FluytVerticalNavigationSpacerItemComponent,
        FluytVerticalNavigationComponent
    ],
    imports     : [
        CommonModule,
        RouterModule,
        MatButtonModule,
        MatDividerModule,
        MatIconModule,
        MatMenuModule,
        MatTooltipModule,
        FluytScrollbarModule
    ],
    exports     : [
        FluytHorizontalNavigationComponent,
        FluytVerticalNavigationComponent
    ]
})
export class FluytNavigationModule
{
}
