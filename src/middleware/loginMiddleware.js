import { body } from 'express-validator';

export const loginMiddleware = [
    body('email')
        .isEmail()
        .withMessage('Email Inválido'),

    body('password')
        .isLength({ min: 6 })
        .withMessage('Debe tener al menos 6 caracteres.'),
]