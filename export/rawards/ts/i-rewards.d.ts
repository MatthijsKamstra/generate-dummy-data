/**
 * Generated with TypescriptJsonDef (version 0.1.2) on 2024-05-15 11:10:04
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
  "name": "Jarrod Visser",
  "id": "7b8411e0-c473-45e1-8f7d-710c1df57398",
  "_id": "0000",
  "value": 1400
}
*/
export interface Users {
	name: string;
	id: string;
	_id: string;
	value: number;
}

/**
* Root 👈
*/
export interface IRewardsObj {
	users: Array<Users>; // users: Users[]; 
	created: string;
}
