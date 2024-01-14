import express from 'express'
import shopControllers from '../controllers/shopController.js'

const router = express.Router();

router
    .get('/', shopControllers.getItems)
    .get('/item/:id', shopControllers.getItem)
    .get('/cart', shopControllers.getCart)
    .post('/cart', shopControllers.postCart);


export default router;