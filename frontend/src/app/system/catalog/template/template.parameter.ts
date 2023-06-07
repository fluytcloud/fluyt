export interface TemplateParameter {
  name: string,
  label: string,
  type: string,
  value?: string,
  required: boolean,
  options: TemplateParameterOption[]
}

export interface TemplateParameterOption {
  label: string,
  value: string
}
