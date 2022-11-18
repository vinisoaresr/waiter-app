import express from 'express';
import mongoose from 'mongoose';
import path from 'node:path';
import { router } from './router/router';

const port = process.env.PORT || 3001;
const app = express();
app.use(express.json());
app.use(router);
app.use('/uploads', express.static(path.resolve(__dirname, 'uploads')));

mongoose.connect('mongodb://localhost:27017')
  .then(() => {
    console.log('Connected to MongoDB');
    app.listen(port, () => {
      console.log(`Server is running on port ${port}`);
    });
  }).catch();
