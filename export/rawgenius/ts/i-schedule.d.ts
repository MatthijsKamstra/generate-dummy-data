/**
 * Generated with TypescriptJsonDef (version 0.1.2) on 2023-02-20 11:01:25
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
  "name": "Angle",
  "surname": "Brouwer",
  "uuid": "6e455d08-c953-4e43-84f9-14b86853032e",
  "id": "0-0",
  "image": {
    "banner": "https://picsum.photos/seed/angle_brouwer/400/200",
    "thumb": "https://picsum.photos/seed/angle_brouwer/200/200",
    "large": "https://picsum.photos/seed/angle_brouwer/800/400"
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
  "banner": "https://picsum.photos/seed/angle_brouwer/400/200",
  "thumb": "https://picsum.photos/seed/angle_brouwer/200/200",
  "large": "https://picsum.photos/seed/angle_brouwer/800/400"
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
