import express from 'express'
import adminControllers from '../controllers/adminController.js'


const router = express.Router()

router
    .get('/', adminControllers.getAdmin)
    .get('/create', adminControllers.getCreate)
    .post('/create', adminControllers.postItem)
    .put('/edit/:id', adminControllers.updItem)
    .delete('/delete/:id', adminControllers.delItem);


export default router;