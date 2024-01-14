import express from 'express';
import dotenv from 'dotenv';
import {resolve} from 'path';
import mainRoutes from './src/routes/mainRoutes.js';
import shopRoutes from './src/routes/shopRoutes.js';
import adminRoutes from './src/routes/adminRoutes.js';
import authRoutes from './src/routes/authRoutes.js';
import { dbConnect } from './src/config/conn.js';

dotenv.config()

dbConnect();

const app = express()
const PORT = process.env.PORT || 8080

app.use(express.urlencoded({extends: true}))

app.use(express.static('public'))

app.set ('view engine', 'ejs');
app.set ('views', resolve() + '/src/views')

app.use('/', mainRoutes)
app.use('/shop', shopRoutes)
app.use('/admin', adminRoutes)
app.use('/auth', authRoutes)



app.listen(PORT, () => console.log(`http://localhost:${PORT}`))
