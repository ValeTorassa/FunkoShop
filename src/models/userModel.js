import { sequelize } from "../config/conn.js";
import { Model, INTEGER, STRING, DATE, Op } from 'sequelize';

class User extends Model { }

User.init(
    {
        user_id: { type: INTEGER, allowNull: false, primaryKey: true, autoIncrement: true },
        email: { type: STRING, allowNull: false },
        password: { type: STRING, allowNull: false },
        lastname: { type: STRING, allowNull: false },
        name: { type: STRING, allowNull: false }
    },
    {
        sequelize,
        modelName: 'user',
        tableName: 'user',
        timestamps: false,
    });

const postRegister = async(data) => {
    try {
        const crearNuevoUsuario = await User.create(data);
        return true;
    } catch (err){
        console.log(err);
        return false;
    }     
}

const postLogin= async(email, password) => {
    try 
    {
        const user = await User.findOne({ where: { email }});
        if(user.password === password){
            return true;
        }else{
            return false;
        }
    } catch (err){
        console.log(err);
        return false;
    }    
}


const modelUser = {
    postLogin,
    postRegister
}

export default modelUser;
