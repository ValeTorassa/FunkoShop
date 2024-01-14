import express from 'express'
import mainControllers from '../controllers/mainController.js'

const router = express.Router();

router
    .get('/', mainControllers.getMain)
    .get('/home', mainControllers.getHome)
    .get('/contact', mainControllers.getContact)
    .get('/about', mainControllers.getAbout)
    .get('/faqs', mainControllers.getFaqs);


export default router;