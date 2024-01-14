import { sequelize } from "../config/conn.js";
import { Model, INTEGER, STRING, DATE, Op } from 'sequelize';

class Product extends Model { }

class Licence extends Model { }

class Category extends Model { }

Product.init(
    {
        product_id: { type: INTEGER, allowNull: false, primaryKey: true, autoIncrement: true },
        product_name: { type: STRING, allowNull: false },
        product_description: { type: STRING, allowNull: false },
        price: { type: INTEGER, allowNull: false },
        stock: { type: INTEGER, allowNull: false },
        discount: { type: INTEGER },
        sku: { type: STRING},
        dues: { type: INTEGER, allowNull: false },
        image_front: { type: STRING, allowNull: false },
        image_back: { type: STRING, allowNull: false },
        create_time:  { type: DATE, allowNull: false },
        licence_id: { type: INTEGER, allowNull: false },
        category_id: { type: INTEGER, allowNull: false },
    },
    {
        sequelize,
        modelName: 'products',
        timestamps: false,
    }
);

Licence.init(
{
    licence_id: { type: INTEGER, allowNull: false, primaryKey: true },
    licence_name: { type: STRING, allowNull: false },
    licence_description: { type: STRING, allowNull: false },
    licence_image: { type: STRING, allowNull: false },
},
{
    sequelize,
    modelName: 'licence',
    tableName: 'licence',
    timestamps: false,
});

Category.init(
{
    category_id: { type: INTEGER, allowNull: false, primaryKey: true },
    category_name: { type: STRING, allowNull: false },
    category_description: { type: STRING, allowNull: false }
},
{
    sequelize,
    modelName: 'category',
    tableName: 'category',
    timestamps: false,
});


Product.belongsTo(Licence, { foreignKey: 'licence_id'});
Licence.hasMany(Product, { foreignKey: 'licence_id'})

Product.belongsTo(Category, { foreignKey: 'category_id'});
Category.hasMany(Product, { foreignKey: 'category_id'})



const getItems = async () => {
    try
    {
        const products = await Product.findAll({
            include: [
                { model: Licence },
                { model: Category }
            ]
        });
        return products.map(p => p.dataValues);
    } catch (err){
        console.log(err);
        return false;
    }
}

const getItem = async(id) => {
    try
    {
        const data = await Product.findOne({ 
            where: 
            { product_id: id },
            include: [
            { model: Licence },
            { model: Category }
        ]});
        return data;
    } catch (err){
        console.log(err);
        return false;
    }   

}

const postItem = async(data) => {
    try 
    {
        const result = await Product.create(data);
        return result;
    } catch (err){
        console.log(err);
        return false;
    }   
}

const updItem = async (id, data) => {
    const result = await Product.update(data, { where: { product_id: id } })
    return result[0];
}


const delItem = async (id) => {
    const result = await Product.destroy({ where: { product_id: id } });
    return result;
}


const getLicences = async () => {
    try {
      const licences = await Licence.findAll();
      return licences.map(licence => licence.dataValues);
    } catch (err) {
      console.log(err);
      return false;
    }
  };
  
  const getCategories = async () => {
    try {
      const categories = await Category.findAll();
      return categories.map(category => category.dataValues);
    } catch (err) {
      console.log(err);
      return false;
    }
  };


const modelProduct = {
    getItems,
    getItem,
    postItem,
    updItem,
    delItem,
    getLicences,
    getCategories
}

export default modelProduct;