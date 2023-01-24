import express from 'express';
import mongoose from 'mongoose';
import path from 'node:path';
import cors from 'cors';
import { router } from './router/router';

const port = process.env.PORT || 3001;
const domain = process.env.DOMAIN || 'localhost';

const app = express();
app.use(cors());
app.use(express.json());
app.use(router);
app.use('/uploads', express.static(path.resolve(__dirname, 'uploads')));

mongoose.connect('mongodb://localhost:27017')
  .then(() => {
    console.log('Connected to MongoDB');
    app.listen(port, () => {
      console.log(`Server is running on http://${domain}:${port}`);
    });
  }).catch();
