import {Injectable} from "@angular/core";
import {Subject} from "rxjs";
import {KeycloakService} from "keycloak-angular";
import {Menu} from "./menu";

@Injectable()
export class MenuService {

  submenuSubject = new Subject<boolean>();

  constructor(private readonly keycloakService: KeycloakService) {
  }

  notifySubmenu(isOpen: boolean): void {
    this.submenuSubject.next(isOpen);
  }

  getSubmenuSubject(): Subject<boolean> {
    return this.submenuSubject;
  }

  getMenus(): Menu[] {
    if (this.keycloakService.isUserInRole('administrator')) {
      return this.getAdminMenu();
    } else if (this.keycloakService.isUserInRole('manager')) {
      return this.getManagerMenu();
    }
    return this.getUserMenu();
  }

  private getAdminMenu(): Menu[] {
    return [
      new Menu("admin/home", "Página inicial", "home"),
      new Menu("admin/customer", "Clientes", "manage_accounts")
    ];
  }

  private getManagerMenu(): Menu[] {
    return [
      new Menu("home", "Página inicial", "home"),
      this.getCatalogMenu(),
      this.getKubernetesMenu(),
      this.getSettingsMenu(),
      new Menu("support", "Suporte", "headset_mic")
    ];
  }

  private getUserMenu(): Menu[] {
    return [
      new Menu("home", "Página inicial", "home"),
      this.getCatalogMenu(),
      this.getKubernetesMenu(),
      this.getSettingsMenu(),
      new Menu("support", "Suporte", "headset_mic")
    ];
  }

  private getCatalogMenu(): Menu {
    const reports = new Menu("catalog", "Catalog", "apps");

    reports.addChildren("Templates", [
      new Menu("generate", "Criar projeto"),
      new Menu("template", "Cadastro")
    ]);

    return reports;
  }

  private getKubernetesMenu(): Menu {
    const reports = new Menu("kubernetes", "Kubernetes", "dataset");

    const general = [
      new Menu("cluster", "Cluster"),
      new Menu("nodes", "Nodes"),
      new Menu("namespaces", "Namespaces"),
      new Menu("events", "Events")
    ];
    reports.addChildren("General", general);

    const workload = [
      new Menu("overview", "Overview"),
      new Menu("pods", "Pods"),
      new Menu("replica-sets", "ReplicaSets"),
      new Menu("deployments", "Deployments"),
      new Menu("daemon-sets", "DaemonSets"),
      new Menu("stateful-sets", "StatefulSets"),
      new Menu("jobs", "Jobs"),
      new Menu("cron-jobs", "CronJobs")
    ];
    reports.addChildren("Workload", workload);

    const config = [
      new Menu("config-maps", "Config Maps"),
      new Menu("limit-ranges", "Limit Ranges"),
      new Menu("resource-quotas", "Resource Quotas"),
      new Menu("horizontal-pod-autoscalers", "HPA"),
      new Menu("secrets", "Secrets")
    ];
    reports.addChildren("Config", config);

    const network = [
      new Menu("services", "Services"),
      new Menu("endpoints", "Endpoints"),
      new Menu("ingresses", "Ingresses")
    ];
    reports.addChildren("Network", network);

    const storage = [
      new Menu("persistent-volume_claims", "Persistent Volume Claims"),
      new Menu("persistent-volumes", "Persistent Volumes"),
      new Menu("storage-classes", "Storage Classes")
    ];
    reports.addChildren("Storage", storage);

    const accessControl = [
      new Menu("service-accounts", "Service Accounts"),
      new Menu("roles", "Roles"),
      new Menu("cluster-roles", "Cluster Roles"),
      new Menu("role-bindings", "Role Bindings"),
      new Menu("cluster-role_bindings", "Cluster Role Bindings")
    ];
    reports.addChildren("Access Control", accessControl);

    return reports;
  }

  private getSettingsMenu(): Menu {
    const settings = new Menu("settings", "Configurações", "settings");

    settings.addChildren("Empresa", [
      new Menu("company", "Filiais")
    ]);

    settings.addChildren("SCM", [
      new Menu("scm", "Provedores Git")
    ]);

    return settings;
  }

}
