/**
 * Generated with TypescriptJsonDef (version 0.1.2) on 2023-02-17 15:41:12
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
 * import { Time, Speaker, Session, Schedule, Rooms, Image, IScheduleObj } from "./ischedule";
 * ```
 * 
 * Name(s) that you possibly need to change:
 * 		Time
 * 		Speaker
 * 		Session
 * 		Schedule
 * 		Rooms
 * 		Image
 * 		IScheduleObj
 */

/**
{
  "start": "09:00",
  "end": "10:00",
  "total": "09:00-10:00"
}
*/
export interface Time {
	start: string;
	end: string;
	total: string;
}

/**
{
  "name": "Chantell",
  "surname": "Van Dijk",
  "uuid": "5fd26f40-2826-499a-b520-6f9deeca97d1",
  "id": "0-0",
  "image": {
    "banner": "https://picsum.photos/seed/chantell_van_dijk/400/200",
    "thumb": "https://picsum.photos/seed/chantell_van_dijk/200/200",
    "large": "https://picsum.photos/seed/chantell_van_dijk/800/400"
  }
}
*/
export interface Speaker {
	name: string;
	surname: string;
	uuid: string;
	id: string;
	image: Image;
}

/**
* ⚠️ Here be dragons
*/
export interface Session {
	description: string;
	title: string;
	speaker: Speaker;
	tags: Array<string>; // tags: string[]; 
}

/**
* ⚠️ Here be dragons
*/
export interface Schedule {
	title: string;
	uuid: string;
	time: Time;
	session: Session;
}

/**
* ⚠️ Here be dragons
*/
export interface Rooms {
	name: string;
	schedule: Array<Schedule>; // schedule: Schedule[]; 
}

/**
{
  "banner": "https://picsum.photos/seed/chantell_van_dijk/400/200",
  "thumb": "https://picsum.photos/seed/chantell_van_dijk/200/200",
  "large": "https://picsum.photos/seed/chantell_van_dijk/800/400"
}
*/
export interface Image {
	banner: string;
	thumb: string;
	large: string;
}

/**
* Root 👈
*/
export interface IScheduleObj {
	rooms: Array<Rooms>; // rooms: Rooms[]; 
	created: string;
	date: string;
}
