/**
 * Generated with TypescriptJsonDef (version 0.1.2) on 2024-05-13 21:57:50
 * from: IRewards
 * 
 * AST = Abstract Syntax Tree
 * 
 * Note:
 * If you provide a .json there should be no null values
 * comments in this document show you the values that need to be changed!
 * 
 * Some (backend)-developers choose to hide empty/null values, you can add them:
 * 		_id?: number;
 * 
 * Import data into project:
 * 
 * ```js
 * import { Users, IRewardsObj } from "./irewards";
 * ```
 * 
 * Name(s) that you possibly need to change:
 * 		Users
 * 		IRewardsObj
 */

/**
{
  "name": "Kortney Jansen",
  "id": "73886630-eda6-4d75-bde4-ac763313c6b3",
  "value": 1000
}
*/
export interface Users {
	name: string;
	id: string;
	value: number;
}

/**
* Root 👈
*/
export interface IRewardsObj {
	users: Array<Users>; // users: Users[]; 
	created: string;
}
