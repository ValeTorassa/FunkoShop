import model from "../models/productsModel.js"

const getCreate = async (req, res) => {
    const categories = await model.getCategories();  
    const licences = await model.getLicences();
    res.render('add', { categories, licences});
}

const postItem = async (req, res) => {
    try {
        const { category, licence, name, description, sku, price, stock, discount, dues } = await (req.body);

        const producto = {
            product_name: name,
            product_description: description,
            price: price,
            stock: stock,
            discount: discount,
            sku: sku,
            dues: dues,
            image_front: "ruta_de_la_imagen_frontal",
            image_back: "ruta_de_la_imagen_trasera",
            create_time: new Date(),
            licence_id: licence,
            category_id: category
        };

        const product = await model.postItem(producto);

        model.postItem(product);
        res.send('El producto se agrego correctamente');
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al procesar la solicitud' });
    }
}

const updItem = async (req, res) => {
    const data = await model.updItem(req.params.id, req.body);
    res.send(data ? 'si se modificó' : 'no se modificó');
}

const delItem = async (req, res) => {
    const data = await model.delItem(req.params.id);
    res.send(data ? 'si se borró' : 'no se borró');
}

const getAdmin = async (req, res) => {

}

const adminControllers = { 
    getCreate,
    postItem,
    updItem,
    delItem,
    getAdmin
}

export default adminControllers