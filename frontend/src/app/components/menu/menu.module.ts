import {NgModule} from "@angular/core";
import {MenuComponent} from "./menu.component";
import {SubmenuComponent} from "./submenu/submenu.component";
import {CommonModule} from "@angular/common";
import {AvatarModule} from "primeng/avatar";
import {RouterModule} from "@angular/router";
import {MatIconModule} from "@angular/material/icon";
import {AvatarGroupModule} from "primeng/avatargroup";
import {MatTooltipModule} from "@angular/material/tooltip";

@NgModule({
  declarations: [
    MenuComponent,
    SubmenuComponent
  ],
  exports: [
    MenuComponent,
    SubmenuComponent
  ],
  imports: [
    CommonModule,
    AvatarModule,
    AvatarGroupModule,
    RouterModule,
    MatIconModule,
    MatTooltipModule
  ]
})
export class MenuModule {

}
