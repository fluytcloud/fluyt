import {ScmType} from "./scm.type";

export interface Scm {
  id: number,
  name: string,
  type: ScmType,
  token: string
}
