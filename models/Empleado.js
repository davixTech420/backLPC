const sequelize = require("../config/database");
const { DataTypes } = require("sequelize");
const User = require("./User");
const Shows = require("./Shows");

const Empleado = sequelize.define("Empleado", {
    userId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        unique:true,
        references: {
            model: User,
            key:'id',
            foreignKey:'userId'
        },
    },
    showId: {
        type: DataTypes.INTEGER,
        allowNull: true,
        references: {
            model: Shows, // Referencia al modelo Shows
            key: 'id',
        },
    },
    rol: {
        type: DataTypes.ENUM('logistica', 'tecnico', 'otro'),
        allowNull: false,
        defaultValue: 'logistica',
    },
});

module.exports = Empleado;