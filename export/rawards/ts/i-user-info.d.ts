/**
 * Generated with TypescriptJsonDef (version 0.1.2) on 2024-05-13 21:57:50
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
  "description": "Gestarte kandidaat (externe) vinden op aanvraag",
  "uuid": "73886630-1436-433d-8421-8e2d658466e7",
  "date": "2024-05-13 21:57:50",
  "value": 100
}
*/
export interface Rewards {
	description: string;
	uuid: string;
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
	updatedTimestamp: string;
	creationTimestamp: string;
}
