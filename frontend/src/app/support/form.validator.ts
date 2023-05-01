import {
  AbstractControl,
  AbstractControlOptions,
  UntypedFormBuilder,
  UntypedFormControl,
  UntypedFormGroup,
  ValidatorFn
} from "@angular/forms";

export class FormValidator {

  public form: UntypedFormGroup;

  constructor(formBuilder: UntypedFormBuilder, controlsConfig: {[key: string]: any;}, options?: AbstractControlOptions | null) {
    this.form = formBuilder.group(controlsConfig, options);
    this.reset();
  }

  public isNotValid(field: string): boolean {
    return !this.getFormControl(field)?.valid;
  }

  public getValue(field: string): any {
    return this.getFormControl(field)?.value
  }

  public addValidatorInAllControls(validator: ValidatorFn, excludeComponents?: string[]): void {
    Object.keys(this.form.controls).forEach(key => {
      if (!excludeComponents?.map(e => e.toLocaleLowerCase())?.includes(key.toLocaleLowerCase())) {
        const control = this.form.controls[key];
        control.setValidators(validator);
        control.updateValueAndValidity();
      }
    });
  }

  public clearAllFieldsValidator(excludeComponents?: string[]): void {
    const components = Object.keys(this.form.controls)
      .filter(c => !excludeComponents?.map(e => e.toLocaleLowerCase()).includes(c.toLocaleLowerCase()));
    this.clearValidatorsOnFields(components);
  }

  public getFormControl(field: string): AbstractControl | null {
    return this.form.get(field);
  }

  public addFormControl(field: string, formControl: UntypedFormControl): void {
    this.form.addControl(field, formControl);
  }

  public removeFormControl(field: string): void {
    this.form.removeControl(field);
  }

  public reset(): void {
    this.form.reset({});
  }

  public clearValidators(field: string): void {
    const control = this.getFormControl(field);
    control?.setValidators(null);
    control?.markAsPristine();
    control?.markAsDirty();
    control?.updateValueAndValidity();
  }

  public addValidator(field: string, validator: ValidatorFn): void {
    const control = this.getFormControl(field);
    control?.setValidators(validator);
    control?.markAsPristine();
    control?.updateValueAndValidity();
  }

  public clearValidatorsOnFields(fields: string[]): void {
    for (const field of fields) {
      this.clearValidators(field);
    }
  }

}
