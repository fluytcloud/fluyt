import {Component, OnInit} from "@angular/core";
import {ActivatedRoute} from "@angular/router";
import {HeaderService} from "../../../../components/header/header.service";
import {TemplateService} from "../template.service";
import {ScmService} from "../../../settings/scm/scm.service";
import {TemplateParameter} from "../template.parameter";

@Component({
  selector: 'app-service-template-generator',
  templateUrl: './template.generator.component.html',
  styleUrls: ['./template.generator.component.scss']
})
export class TemplateGeneratorComponent implements OnInit {

  loading = true;
  templateId?: number;
  parameters: TemplateParameter[] = [];
  repository?: string;
  showDialogStatus = false;
  statusList: any[] = [];

  constructor(private serviceTemplateService: TemplateService,
              private scmService: ScmService,
              private activatedRoute: ActivatedRoute,
              private headerService: HeaderService) {
  }

  ngOnInit(): void {
    const id = this.activatedRoute.snapshot.paramMap.get('id');
    this.templateId = +id!;

    this.notifyHeader();

    this.serviceTemplateService.getTemplateParameters(this.templateId).subscribe(e => {
      this.parameters = e;
    })
  }

  notifyHeader() {
    this.headerService.notifyHeader({
      name: 'Service template form',
      breadcrumbs: [
        {
          label: 'Catalog',
          link: '/catalog'
        },
        {
          label: 'Service template catalog',
          link: '/catalog/generate'
        },
        {
          label: 'form',
          link: '/catalog/generate/' + this.templateId
        }
      ]
    });
  }

  reset() {
    this.parameters.forEach(e => e.value = undefined);
    this.repository = undefined;
    this.statusList = [];
  }

  isValid(): boolean {
    return !!this.repository && this.parameters.filter(e => e.required && !e.value).length === 0;
  }

  generate() {
    const params = this.parameters
      .reduce((a, v) => ({...a, [v.name]: v.value}), {});

    this.serviceTemplateService.generateProject(this.templateId!, this.repository!, params).subscribe(uuid => {
      this.showDialogStatus = true;
      this.reset();

      this.serviceTemplateService.getGenerateStatus(this.templateId!, uuid).subscribe(status => {
        this.statusList = [...this.statusList, status];
      });
    });
  }

}
