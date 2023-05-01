import {Component, OnInit} from "@angular/core";
import {Menu} from "./menu";
import {MenuService} from "./menu.service";
import {NavigationEnd, Router} from "@angular/router";
import {UserInfo} from "../../auth/user.info";
import {AuthOrganizationService} from "../../auth/organization/auth.organization.service";

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.scss']
})
export class MenuComponent implements OnInit {

  menus: Menu[];
  selected?: Menu;
  userInfo?: UserInfo;
  avatarLabel?: string;

  constructor(private readonly router: Router,
              private readonly authService: AuthOrganizationService,
              private readonly menuService: MenuService) {
    this.menus = this.menuService.getMenus()
  }

  ngOnInit(): void {
    this.authService.get().subscribe(it => {
      this.userInfo = it;
      this.avatarLabel = it.name.match(/\b(\w)/g)!.join('');
    });

    this.router.events.subscribe(event => {
      if (event instanceof NavigationEnd) {
        this.unselectMenus();
        this.selectMenus(event.url);
      }
    });
  }

  unselectMenus(): void {
    this.menus.forEach(menu => {
      menu.selected = false;
      menu.children.forEach((value: Menu[], key: string) => {
        value.forEach(submenu => submenu.unselect());
      });
    });
  }

  selectMenus(url: string): void {
    const route = url.split("/");
    let menu = this.menus.find(it => it.url === route[1]);
    if (menu) {
      this.selected = menu;
      menu.select();
      menu.children.forEach((value: Menu[], key: string) => {
        const submenu = value.find(it => it.url === route[2]);
        if (submenu) {
          submenu.select();
        }
      });
      this.menuService.notifySubmenu(menu.children.size > 0);
    }
  }

  selectMenu(menu: Menu): void {
    let url = menu.url;

    const submenu = menu.children.values().next();
    if (submenu.value) {
      url += "/" + submenu.value[0].url;
    }

    this.router.navigateByUrl(url);
  }

  logout(): void {
    this.authService.logout();
  }

}
