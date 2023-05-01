import {NgModule} from "@angular/core";
import {LoaderComponent} from "./loader.component";
import {CommonModule} from "@angular/common";
import {MatLegacyProgressSpinnerModule as MatProgressSpinnerModule} from "@angular/material/legacy-progress-spinner";

@NgModule({
  declarations: [
    LoaderComponent
  ],
  exports: [
    LoaderComponent
  ],
  imports: [
    CommonModule,
    MatProgressSpinnerModule
  ]
})
export class LoaderModule {
}
