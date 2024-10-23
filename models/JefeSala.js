const { DataTypes } = require("sequelize");
const sequelize = require("../config/database");
const User = require("./User");
const Salas = require("./Salas");

const JefeSala = sequelize.define("jefesala", {
  userId: {
    allowNull: false,
    type: DataTypes.INTEGER,
    unique:true,
    references: {
      model: User,
      key:'id',
      foreignKey:'userId'
    },
  },
  salaId: {
    allowNull: false,
    type: DataTypes.INTEGER,
    unique:true,
    references: {
      model: Salas,
      key:'id',
      foreignKey:'salaId'
     
    },
  },
});

module.exports = JefeSala;

