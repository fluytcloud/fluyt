import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { MatLegacyButtonModule as MatButtonModule } from '@angular/material/legacy-button';
import { MatDividerModule } from '@angular/material/divider';
import { MatIconModule } from '@angular/material/icon';
import { MatLegacyMenuModule as MatMenuModule } from '@angular/material/legacy-menu';
import { MatLegacyTooltipModule as MatTooltipModule } from '@angular/material/legacy-tooltip';
import { FluytScrollbarModule } from 'fluyt/directives/scrollbar/public-api';
import { FluytHorizontalNavigationBasicItemComponent } from 'fluyt/components/navigation/horizontal/components/basic/basic.component';
import { FluytHorizontalNavigationBranchItemComponent } from 'fluyt/components/navigation/horizontal/components/branch/branch.component';
import { FluytHorizontalNavigationDividerItemComponent } from 'fluyt/components/navigation/horizontal/components/divider/divider.component';
import { FluytHorizontalNavigationSpacerItemComponent } from 'fluyt/components/navigation/horizontal/components/spacer/spacer.component';
import { FluytHorizontalNavigationComponent } from 'fluyt/components/navigation/horizontal/horizontal.component';
import { FluytVerticalNavigationAsideItemComponent } from 'fluyt/components/navigation/vertical/components/aside/aside.component';
import { FluytVerticalNavigationBasicItemComponent } from 'fluyt/components/navigation/vertical/components/basic/basic.component';
import { FluytVerticalNavigationCollapsableItemComponent } from 'fluyt/components/navigation/vertical/components/collapsable/collapsable.component';
import { FluytVerticalNavigationDividerItemComponent } from 'fluyt/components/navigation/vertical/components/divider/divider.component';
import { FluytVerticalNavigationGroupItemComponent } from 'fluyt/components/navigation/vertical/components/group/group.component';
import { FluytVerticalNavigationSpacerItemComponent } from 'fluyt/components/navigation/vertical/components/spacer/spacer.component';
import { FluytVerticalNavigationComponent } from 'fluyt/components/navigation/vertical/vertical.component';

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
