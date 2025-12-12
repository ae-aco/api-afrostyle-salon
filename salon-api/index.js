const express = require('express'); // imported the express library here, this required for the API to work
const mysql = require('mysql2');
const app = express(); //initalises the express server
const PORT = 3000;

// This creates a mySQL connection pool
const pool = mysql.createPool({
  host: 'localhost', // mySQL server host
  user: '', // mySQL user - created specifically for this assignment
  password: '', //mySQL password - created specifically for this assignment
  database: 'afro_salon', // mySQL database name
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

//  telling the app that is should listen to the port specified above '3000'
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
  });

app.use(express.json()); // Middleware to parse JSON bodies

//a route to send a get request to retrieve data from the server, this confirms the API is running
app.get('/', (req, res) => {
  res.send('Welcome to our API!');
});

//a route to send a post request to create user, '201' is to create a client
app.post('/create-client', (req, res) => {
    const { client_name, client_age, client_email, client_mobile } = req.body;

// if there is an error it will return the response 500 and the message displayed will be Database Error
    const sql = 'INSERT INTO clients (client_name, client_age, client_email, client_mobile) VALUES (?, ?, ?, ?)';
    pool.query(sql, [client_name, client_age, client_email, client_mobile], (err, result) => {
      if (err) {
        console.error('Error creating client:', err.message);
        return res.status(500).json({ error: 'Database error' })
      }

      res.status(201).json({ id: result.insertId, message: `Client ${client_name} created successfully` });
    });
  });

  //a route to retrieve a record or multiple records from clients entity
  app.get('/clients', (req, res) => {
    const sql = 'SELECT * FROM clients';
    
    pool.query(sql, (err, results) => {
      if (err) {
        console.error('Error fetching clients:', err.message);
        return res.status(500).json({ error: 'Database error' });
      }
      
      res.status(200).json(results);
    });
  });

//a route to update data in clients entity
app.put('/update-client/:id', (req, res) => {
  const clientId = req.params.id;
  const { client_name, client_age, client_email, client_mobile } = req.body;
  
  const sql = 'UPDATE clients SET client_name = ?, client_age = ?, client_email = ?, client_mobile = ? WHERE id = ?';
  pool.query(sql, [client_name, client_age, client_email, client_mobile, clientId], (err, result) => {
    if (err) {
      console.error('Error updating client:', err.message);
      return res.status(500).json({ error: 'Database error' });
    }
    
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Client not found' });
    }
    
    res.status(200).json({ message: `Client ${client_name} updated successfully` });
  });
});

//a route to delete a client from clients entity
app.delete('/delete-client/:id', (req, res) => {
  const clientId = req.params.id;
  
  const sql = 'DELETE FROM clients WHERE id = ?';
  pool.query(sql, [clientId], (err, result) => {
    if (err) {
      console.error('Error deleting client:', err.message);
      return res.status(500).json({ error: 'Database error' });
    }
    
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Client not found' });
    }
    
    res.status(200).json({ message: 'Client deleted successfully' });
  });
});

 //a route to retrieve a stylist availability
 app.get('/stylist-availability', (req, res) => {
  const sql = 'SELECT s.stylist_name, a.availability_date, a.start_time FROM stylists s INNER JOIN availability a ON s.stylist_id = a.stylist_id';
  
  pool.query(sql, (err, results) => {
    if (err) {
      console.error('Error fetching stylists:', err.message);
      return res.status(500).json({ error: 'Database error' });
    }
    
    res.status(200).json(results);
  });
});

//a route to create an appointment POST
app.post('/create-appointment', (req, res) => {
  const { service_id, stylist_id, client_id, appointment_date, duration, status } = req.body;

  const sql = 'INSERT INTO appointments (service_id, stylist_id, client_id, appointment_date, duration, status) VALUES (?, ?, ?, ?, ?, ?)';
  pool.query(sql, [service_id, stylist_id, client_id, appointment_date, duration, status], (err, result) => {
    if (err) {
      console.error('Error creating appointment', err.message);
      return res.status(500).json({ error: 'Database error' })
    } 

    res.status(201).json({ id: result.insertId, message: `Thanks for booking, your appointment is ${status}. Your appointment for ${service_id} with ${stylist_id} on ${appointment_date} will last ${duration} minutes` });
  });
});

// a route to update an appointment PUT
app.put('/update-appointment/:id', (req, res) => {
  const appointmentId = req.params.id;
  const { service_id, stylist_id, client_id, appointment_date, duration, status } = req.body;
  
  const sql = 'UPDATE appointments SET service_id = ?, stylist_id = ?, client_id = ?, appointment_date = ? duration = ? status = ? WHERE id = ?';
  pool.query(sql, [service_id, stylist_id, client_id, appointment_date, duration, status, appointmentId], (err, result) => {
    if (err) {
      console.error('Error updating appointment:', err.message);
      return res.status(500).json({ error: 'Database error' });
    }
    
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Appointment not found' });
    }
    
    res.status(200).json({ message: `Your appointment on ${appointment_date} has been updated successfully` });
  });
});

//a route to delete an appointment from the database
app.delete('/delete-appointment/:id', (req, res) => {
  const appointmentId = req.params.id;
  
  const sql = 'DELETE FROM appointments WHERE id = ?';
  pool.query(sql, [appointmentId], (err, result) => {
    if (err) {
      console.error('Unable to cancel the appointment, contact the salon', err.message);
      return res.status(500).json({ error: 'Database error' });
    }
    
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Appointment does not exist' });
    }
    
    res.status(200).json({ message: 'Appointment cancelled successfully' });
  });
});
