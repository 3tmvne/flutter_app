const express = require('express');
const cors = require('cors');

const app = express();
app.use(cors());

app.get('/api/message', (req, res) => {
  res.json({ message: "Salam from Node.js 🚀" });
});

app.listen(3000, () => {
  console.log('Server running on http://localhost:3000');
});