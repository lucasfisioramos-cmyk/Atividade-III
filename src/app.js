import express from 'express';
import vendedorRoutes from './routes/vendedorRoutes.js';

const app = express();

app.use(express.json());
app.use('/vendedores', vendedorRoutes);

export default app;