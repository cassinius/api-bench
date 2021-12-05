use diesel::prelude::*;
// use uuid::Uuid;

use diesel::pg::PgConnection;
use crate::models;


pub fn find_retailer_by_id(r_id: i32, conn: &PgConnection) 
-> Result<Option<models::Retailer>, diesel::result::Error>
{
	use crate::schema::retailer::dsl::*;

	let one_retailer = retailer
		.find(r_id)
		.first::<models::Retailer>(conn)
		.optional()?;
	
	Ok(one_retailer)
}


pub fn get_all_retailers(conn: &PgConnection)
-> Result<Option<Vec<models::Retailer>>, diesel::result::Error>
{
	use crate::schema::retailer::dsl::*;

  let all_retailers = retailer
		.load::<models::Retailer>(conn)
		.optional()?;
	
		Ok(all_retailers)
}


// Run query using Diesel to insert a new database row and return the result.
// pub fn insert_new_user(
//     // prevent collision with `name` column imported inside the function
//     nm: &str,
//     conn: &SqliteConnection,
// ) -> Result<models::User, diesel::result::Error> {
//     // It is common when using Diesel with Actix web to import schema-related
//     // modules inside a function's scope (rather than the normal module's scope)
//     // to prevent import collisions and namespace pollution.
//     use crate::schema::users::dsl::*;

//     let new_user = models::User {
//         id: Uuid::new_v4().to_string(),
//         name: nm.to_owned(),
//     };

//     diesel::insert_into(users).values(&new_user).execute(conn)?;

//     Ok(new_user)
// }
