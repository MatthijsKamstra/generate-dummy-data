/**
 * Generated with TypescriptJsonDef (version 0.1.2) on 2024-05-15 11:10:04
 * from: IUserInfo
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
 * import { Rewards, IUserInfoObj } from "./iuserinfo";
 * ```
 * 
 * Name(s) that you possibly need to change:
 * 		Rewards
 * 		IUserInfoObj
 */

/**
{
  "description": "Lead die tot een inzet/deal leidt",
  "id": "7b8411e0-bac3-4c79-85d5-28e970b50ff4",
  "date": "2024-05-15 11:10:04",
  "value": 100
}
*/
export interface Rewards {
	description: string;
	id: string;
	date: string;
	value: number;
}

/**
* Root 👈
*/
export interface IUserInfoObj {
	firstname: string;
	date_employment: string;
	total_value: number;
	id: string;
	rewards: Array<Rewards>; // rewards: Rewards[]; 
	lastname: string;
	_id: string;
	updatedTimestamp: string;
	creationTimestamp: string;
}
