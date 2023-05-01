import {Component, HostBinding, Input} from "@angular/core";

@Component({
  selector: 'app-form-container',
  templateUrl: './form.container.component.html',
  styleUrls: ['./form.container.component.scss'],
  host: {'class': 'fc-form-container'}
})
export class FormContainerComponent {

  @Input() inputId!: string;
  @Input() label!: string;
  @Input() description?: string;
  @Input() value?: string | undefined | null;
  @Input() required: boolean = false;
  @Input() isNotValid: boolean = true;
  @HostBinding('class.fc-form-container-label-above') @Input() labelAbove: boolean = false;

}
