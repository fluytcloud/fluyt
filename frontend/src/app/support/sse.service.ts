import {Injectable, NgZone} from "@angular/core";
import {Observable} from "rxjs";
// @ts-ignore
import {SSE} from "sse.js";
import {KeycloakService} from "keycloak-angular";

@Injectable()
export class SseService {

  constructor(private _zone: NgZone,
              private keycloakService: KeycloakService) {
  }

  getServerSentEvent(url: string): Observable<any> {
    return new Observable(observer => {
      this.keycloakService.getToken().then(token => {
        const eventSource = this.getEventSource(url, token);
        eventSource.stream();
        eventSource.onmessage = (event: any) => {
          this._zone.run(() => {
            observer.next(JSON.parse(event.data));
          });
        };
        eventSource.onerror = (error: any) => {
          this._zone.run(() => {
            observer.error(error);
          });
        };
      });
    });
  }

  private getEventSource(url: string, token: string): SSE {
    return new SSE(url, {headers: {Authorization: 'Bearer ' + token}});
  }
}
