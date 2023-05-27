import {Injectable} from "@angular/core";
import {webSocket, WebSocketSubject} from 'rxjs/webSocket';
import {environment} from "../../../../environments/environment";
import {Observable} from "rxjs";
import {KeycloakService} from "keycloak-angular";

@Injectable()
export class KubernetesTerminalService {

  map = new Map<string, WebSocketSubject<any>>();

  constructor(private keycloakService: KeycloakService) {
  }

  connect(context: string): Observable<WebSocketSubject<any>> {
    return new Observable(obs => {
      this.keycloakService.getToken().then(token => {
        const socket = webSocket({
          url: `${environment.websocket}/kubernetes/pod/terminal/${context}`,
          protocol: ["access_token", token]
        });
        this.map.set(context, socket);
        obs.next(socket);
        obs.complete();
      });
    });
  }

  send(context: string, data: any) {
    this.map.get(context)?.next(data);
  }

  close(context: string) {
    this.map.get(context)?.complete();
  }

}
