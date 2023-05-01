import {Sort} from "./sort";

export interface Pageable {

  sort: Sort;
  offset: number;
  pageNumber: number;
  pageSize: number;
  paged: boolean;
  unpaged: boolean;

}
