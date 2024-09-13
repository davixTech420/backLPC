const { DataTypes } = require("sequelize");
const sequelize = require("../config/database");
const User = require("./User");

const Mensajes = sequelize.define("Mensajes", {
    emisor:{
        allowNull: false,
        type: DataTypes.INTEGER,
        references: {
          model: User,
          key:'id',
          foreignKey:'emisor'
        },
    },
    receptor: {
    allowNull: false,
    type: DataTypes.INTEGER,
    references: {
      model: User,
      key:'id',
      foreignKey:'receptor'
    },
  },
  contenido:{
    allowNull: false,
    type: DataTypes.STRING
  },
  fechaEnvio:{
    type: DataTypes.DATEONLY
  },
  leido:{
    type: DataTypes.BOOLEAN,
    defaultValue: false
  }

});

Mensajes.belongsTo(User, { as: 'receptorUser', foreignKey: 'receptor' });
Mensajes.belongsTo(User, { as: 'emisorUser', foreignKey: 'emisor' });

module.exports = Mensajes;
