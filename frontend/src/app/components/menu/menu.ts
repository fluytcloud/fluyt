export class Menu {

  url: string;
  name: string;
  selected: boolean = false;
  children: Map<string, Menu[]> = new Map<string, Menu[]>;
  icon?: string;

  constructor(url: string, name: string, icon?: string) {
    this.url = url;
    this.name = name;
    this.icon = icon;
  }

  addChildren(title: string, menus: Menu[]): void {
    this.children.set(title, menus);
  }

  select(): Menu {
    this.selected = true;
    return this;
  }

  unselect(): Menu {
    this.selected = false;
    return this;
  }


}
