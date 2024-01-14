import model from "../models/productsModel.js"

const getItems =  async (req, res) => {
    const products = await model.getItems();
    res.render('shop', { products });
}

const getItem = async (req, res) => {
    const item = await model.getItem(req.params.id);
    const products = await model.getItems();
    res.render('item', { item ,products })
}

const getCart = (req, res) => {
    res.send('Visitado desde shop/getCart')
}
const postCart = (req, res) => {
    res.send('Visitado desde shop/postCart')
}


const shopControllers = {
    getItems,
    getItem,
    getCart,
    postCart
}

export default shopControllers;