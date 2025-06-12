import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';

const USERS_API = process.env.REACT_APP_USERS_SERVICE_URL;


function App() {
  const [users, setUsers] = useState([]);
  const [username, setUsername] = useState('');
  const [email, setEmail] = useState('');
  const [error, setError] = useState('');

  const fetchUsers = async () => {
    try {
      const response = await axios.get(`${USERS_API}`);
      setUsers(response.data.data.users);
    } catch (err) {
      console.error(err);
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');
    try {
      await axios.post(`${USERS_API}`, { username, email });
      setUsername('');
      setEmail('');
      fetchUsers();
    } catch (err) {
      if (err.response?.data?.message) {
        setError(err.response.data.message);
      } else {
        setError('Something went wrong');
      }
    }
  };

  // Fetch users when the component mounts
  useEffect(() => {
    fetch("/users")
      .then((res) => res.json())
      .then((data) => {
        const usernames = data.map((user) => ({
          username: user.username,
        }));
        setUsers(usernames);
      })
      .catch((err) => console.error("Error fetching users:", err));
  }, []);
  

  return (
    <div className="container">
      <h1>All Users</h1>
      <hr />
      <form onSubmit={handleSubmit} className="form">
        <input
          type="text"
          placeholder="Enter a username"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
          required
        />
        <input
          type="email"
          placeholder="Enter an email address"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />
        <button type="submit">Register</button>
      </form>
      {error && <p className="error">{error}</p>}

      <div className="users-section">
        <h2>Registered Users</h2>
        <ol className="user-list">
          {users.map((user) => (
            <li key={user.id}>
              <strong>{user.username}</strong>
            </li>
          ))}
        </ol>
      </div>
    </div>
  );
}

export default App;
