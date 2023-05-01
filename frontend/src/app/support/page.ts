import {Sort} from "./sort";
import {Pageable} from "./pageable";

export interface Page<T> {

  totalElements: number
  totalPages: number;
  size: number;
  content: T[];
  number: number;
  numberOfElements: number;
  last: boolean;
  first: boolean;
  empty: boolean;
  sort: Sort;
  pageable: Pageable;


}
