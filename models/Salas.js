const sequelize = require("../config/database");
const { DataTypes } = require("sequelize");



const Salas = sequelize.define("Salas", {
    imagen : {
        type: DataTypes.STRING,
        allowNull: false,
    },
    nombre: {
        type: DataTypes.STRING,
        allowNull: false,
        unique:true,
    },
    direccion: {
        type: DataTypes.STRING,
        allowNull: false,
        unique:true,
    },
    capacidad: {
        type: DataTypes.INTEGER,
        allowNull:false,
    },
    estado: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
    },
});



module.exports = Salas;