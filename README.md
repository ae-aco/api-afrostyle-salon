# Afro Salon API Project

## Mock Scenario
In this mock scenario, I have designed and implemented an **afrocentric salon reservation system** using express.js in node.js. This API allows clients to book either a hairdressing appointment. Clients can create an account, view appointments based on the stylists availability, as well as book, modify and cancel an appointment. 
<br>

## Checklist for this project
- Create a database for this project and create at least 3 tables
- Implement the following endpoints: POST, GET, PUT, DELETE
- Add HTTP response codes and error handling to the endpoints.

## Folders & Files
The files used in this project can be found in this branch *api-afrostyle-salon*.
- [schema/afro_salon.sql](schema/afro_salon.sql)
	- Use this file in mySQL to create and use the database. Dummy data is included.
- [salon-api/index.js](salon-api/index.js)
	- Use this file to run the API.
	
## API Testing (Bruno or Postman)
	
This project includes a Bruno collection and Postman collection to test all API endpoints.
- [Bruno collection](/bruno-collection/afro-salon-api-br.json)
- [Postman collection](postman-collection/afro-salon-api-pm.json)
	
### How to use the collections
1. Install Bruno or Postman
2. Open your chosen API client 
3. Import the collection: 
	- `/bruno-collection/afro-salon-ap-br.json` 
	- `/postman-collection/afro-salon-api-pm.json` 
4. Ensure the API is running on `http://localhost:3000`
5. Run requests as needed