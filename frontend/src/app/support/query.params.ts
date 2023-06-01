import {HttpParams} from "@angular/common/http";

export class QueryParams {

  static transform(object: any): HttpParams {
    let params = new HttpParams();

    let key: keyof typeof object;
    for (key in object) {
      const value = object[key];
      if (value) {
        if (Array.isArray(value)) {
          for (const valueElement of value) {
            params = params.append(key, valueElement);
          }
        } else {
          params = params.append(key, value);
        }
      }
    }

    return params;
  }

}
