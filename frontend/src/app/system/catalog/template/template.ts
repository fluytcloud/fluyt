import {Scm} from "../../settings/scm/scm";

export interface Template {
  id: number,
  name: string,
  templateScm: Scm,
  templateRepository: string,
  templateBranch: string,
  targetScm: Scm,
  targetBranch: string
}
