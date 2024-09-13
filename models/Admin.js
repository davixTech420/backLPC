const { DataTypes } = require("sequelize");
const sequelize = require("../config/database");
const User = require("./User");

const Administrador = sequelize.define("Admin", {
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
});


module.exports = Administrador;
