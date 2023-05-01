import {Component, EventEmitter, OnDestroy, Output} from "@angular/core";
import {Footer} from "./footer";
import {Subscription} from "rxjs";
import {FooterService} from "./footer.service";

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss']
})
export class FooterComponent implements OnDestroy {

  footers: Footer[] = []
  subscription!: Subscription;
  index = 0;

  @Output() onShow = new EventEmitter();
  @Output() onHide = new EventEmitter();

  constructor(private footerService: FooterService) {
    this.subscription = this.footerService.get()
      .subscribe(footer => {
        this.footers.push(footer);
        this.index = this.footers.length -1;
        if (this.footers.length === 1) {
          this.onShow.emit();
        }
      });
  }

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
  }

  remove(tabIndex: number): void {
    this.footers.splice(tabIndex, 1);
    if (this.footers.length === 0) {
      this.onHide.emit();
    }
  }

}
