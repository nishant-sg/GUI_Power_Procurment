import logo from "./logo.svg";
import "./App.css";
import React, { useState, useEffect } from "react";

function App() {
  const [data, setData] = useState([]);

  useEffect(() => {
    fetchData();
  }, []);

  const [value, setValue] = React.useState('Select State');

 const handleChange = (event) => {

   setValue(event.target.value);

 };

  const fetchData = async () => {
    try {
      const response = await fetch("http://localhost:5000/test");
      if (!response.ok) {
        throw new Error("Failed to fetch data");
      }
      const res = await response.text();
      setData(res);
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  };
  return (
    <div className="App">
      <header className="App-header">
        <p>
          <b>Power Procurement Risk Analysis Optimizer</b>
        </p>
      </header>
      <body>
      <div className="StateSelectDropDown">
            <select value={value} onChange={handleChange}> 
            // use {value} for event handling at backend
              <option value="Select State">Select State</option>
              <option value="Rajasthan">Rajasthan</option>
              <option value="Tamil Nadu">Tamil Nadu</option>
            </select>
        </div>
      </body>
    </div>
  );
}

export default App;
