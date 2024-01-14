import express from 'express'
import authControllers from '../controllers/authController.js'
import { loginMiddleware } from './../middleware/loginMiddleware.js'
import { validatorMiddleware } from './../middleware/validatorMiddleware.js'


const router = express.Router()

router
    .get('/login', authControllers.getLogin)
    .post('/login', loginMiddleware, validatorMiddleware, authControllers.postLogin)
    .get('/register', authControllers.getRegister)
    .post('/register', authControllers.postRegister)
    .get('/logout', authControllers.getLogout);

export default router;