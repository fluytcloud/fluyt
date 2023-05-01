import {Injectable} from "@angular/core";
import {Subject} from "rxjs";
import {Header} from "./header";

@Injectable()
export class HeaderService {

  headerSubject = new Subject<Header>();

  notifyHeader(header: Header): void {
    this.headerSubject.next(header);
  }

  getHeaderSubject(): Subject<Header> {
    return this.headerSubject;
  }

}
