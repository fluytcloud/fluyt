import {Injectable} from "@angular/core";
import {webSocket, WebSocketSubject} from 'rxjs/webSocket';
import {environment} from "../../../../environments/environment";
import {map, Observable} from "rxjs";
import {HttpClient} from "@angular/common/http";

@Injectable()
export class KubernetesTerminalService {

  map = new Map<string, WebSocketSubject<any>>();

  constructor(private http: HttpClient) {
  }

  open(context: string, request: any): Observable<any> {
    const url = `${environment.system_v1}/kubernetes/pod/terminal`;
    return this.http.post<void>(url, request);
  }

  connect(context: string): Observable<any> {
    const socket = webSocket({
      url: `${environment.websocket}/pod/terminal/${context}`
    });
    this.map.set(context, socket);
    console.log(socket);
    return socket;
  }

  send(context: string, data: any) {
    this.map.get(context)?.next(data);
  }

  close(context: string) {
    this.map.get(context)?.complete();
  }

}
