const getMain = (req, res) => {
    res.render('index')
}
const getHome = (req, res) => {
    res.send('Visitado desde getHome')
}
const getContact = (req, res) => {
    res.send('Visitado desde getContact')
}
const getAbout = (req, res) => {
    res.send('Visitado desde getAbout')
}
const getFaqs = (req, res) => {
    res.send('Visitado desde getFaqs')
}


const mainControllers = {
    getMain,
    getHome,
    getContact,
    getAbout,
    getFaqs
}

export default mainControllers;