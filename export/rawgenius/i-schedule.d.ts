/**
 * Generated with TypescriptJsonDef (version 0.1.2) on 2023-02-17 12:08:10
 * from: ISchedule
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
 * import { User, Speaker, Schedule, Rooms, IScheduleObj } from "./ischedule";
 * ```
 * 
 * Name(s) that you possibly need to change:
 * 		User
 * 		Speaker
 * 		Schedule
 * 		Rooms
 * 		IScheduleObj
 */

/**
{
  "name": "Jarrod",
  "surname": "Visser",
  "id": "5f0f6590-ddea-49b3-bd33-f5bfff4889e8"
}
*/
export interface User {
	name: string;
	surname: string;
	id: string;
}

/**
{
  "description": "Porro minus incidunt nesciunt.",
  "title": "Aliquid et repellendus tempore ratione",
  "user": {
    "name": "Jarrod",
    "surname": "Visser",
    "id": "5f0f6590-ddea-49b3-bd33-f5bfff4889e8"
  }
}
*/
export interface Speaker {
	description: string;
	title: string;
	user: User;
}

/**
{
  "title": "Session 1",
  "speaker": {
    "description": "Porro minus incidunt nesciunt.",
    "title": "Aliquid et repellendus tempore ratione",
    "user": {
      "name": "Jarrod",
      "surname": "Visser",
      "id": "5f0f6590-ddea-49b3-bd33-f5bfff4889e8"
    }
  },
  "time": "09:00-10:00"
}
*/
export interface Schedule {
	title: string;
	speaker: Speaker;
	time: string;
}

/**
* ⚠️ Here be dragons
*/
export interface Rooms {
	name: string;
	schedule: Array<Schedule>; // schedule: Schedule[]; 
}

/**
* Root 👈
*/
export interface IScheduleObj {
	rooms: Array<Rooms>; // rooms: Rooms[]; 
	created: string;
	date: string;
}
