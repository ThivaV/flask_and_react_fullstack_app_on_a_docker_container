import React, { useState, useEffect } from 'react';

function App() {
  const [data, setData] = useState([]);

  useEffect(() => {
    fetch("/inverter")
      .then(resp => resp.json())
      .then(data => {
        setData(data);
        console.log(data);
      });
  }, []);

  return (
    <div>
      {data.map((item, index) => (
        <p key={index}>{item}</p>
      ))}
    </div>
  );
}

export default App;
