// This file can be replaced during build by using the `fileReplacements` array.
// `ng build` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.

export const environment = {
  production: false,
  keycloak: 'http://localhost:18080/',
  companies: 'http://localhost:8080/companies',
  organizations: 'http://localhost:8080/organizations',
  auth: 'http://localhost:8080/auth',
  admin_customer: 'http://localhost:8080/api/admin/customer',
  system_v1: "http://localhost:8080/api/v1",
  public_v1: "http://localhost:8080/api/public/v1",
  websocket: 'ws://localhost:8080'
};

/*
 * For easier debugging in development mode, you can import the following file
 * to ignore zone related error stack frames such as `zone.run`, `zoneDelegate.invokeTask`.
 *
 * This import should be commented out in production mode because it will have a negative impact
 * on performance if an error is thrown.
 */
// import 'zone.js/plugins/zone-error';  // Included with Angular CLI.
