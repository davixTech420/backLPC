const sequelize = require("../config/database");
const { DataTypes } = require("sequelize");
const Salas = require("./Salas");
const User = require("./User");

const Shows = sequelize.define("Shows", {
    imagen:{
        type: DataTypes.STRING,
        allowNull: false,
    },
    nombre: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    cuposDisponibles :{
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    fechaPresentar:{
        type: DataTypes.DATEONLY,
        allowNull: false,
    },
    horaInicio:{
        type: DataTypes.TIME,
        allowNull: false,
    },
    horaFin:{
        type: DataTypes.TIME,
        allowNull: false,
    },

    estado:{
        type: DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: false,

    },
    salaId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: Salas,
            key:'id',
        },
    },
    clienteId:{
        type: DataTypes.INTEGER,
        unique:false,
        allowNull: true,
        references:{
            model: User,
            key:'id',
        }
    },
});

module.exports = Shows;