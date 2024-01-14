import model from "../models/userModel.js"

const getLogin = (req, res) => {
    res.render('login');
}

const postLogin = async (req, res) => {
    const { email, password } = await req.body;

    console.log("Email:", email);
    console.log("Password:", password);

    const bool = await model.postLogin(email, password);
    if(bool == true){
        res.send('la sesion se inicio correctamente')
    }else{
        res.send('las credenciales son incorrectas')
    }
}
const getRegister = (req, res) => {
    res.render('register')
}
const postRegister = async (req, res) => {
    const { name, lastname, email, password } = await (req.body);

    const user = {
        email: email,
        name: name,
        lastname: lastname,
        password: password
    }

    const bool = await model.postRegister(user);
    if(bool == true){
        res.send('El registro se hizo correctamente')
    }else{
        res.send('El registro no se pudo realizar o el email ya existe')
    }
}
const getLogout = (req, res) => {
    res.send('Visitado desde auth/getLogout')
}

const authControllers = {
    getLogin,
    postLogin,
    getRegister,
    postRegister,
    getLogout
}


export default authControllers;