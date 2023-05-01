import {EventEmitter, Injectable} from "@angular/core";
import {Footer} from "./footer";

@Injectable()
export class FooterService {

  private _footer: EventEmitter<Footer> = new EventEmitter<Footer>();

  add(footer: Footer): void {
    this._footer.emit(footer);
  }

  get(): EventEmitter<Footer> {
    return this._footer;
  }

}
