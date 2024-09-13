const { DataTypes } = require('sequelize');
const sequelize = require('../config/database'); // Assuming you have a database configuration
const Shows = require('./Shows');
const User = require('./User');
const Salas = require('./Salas');

const Pedidos = sequelize.define('Pedidos', {

  showId: {
    type: DataTypes.INTEGER,
    allowNull: false,
    unique: true,
    references: {
      model: Shows,
      key: 'id',
      foreignKey:'showId'
    }
  },
 
  salaId: {
    type: DataTypes.INTEGER,
    allowNull: true, 
    references: {
      model: Salas,
      key: 'id'
    }
  },
  estado: {
    type: DataTypes.ENUM('pendiente', 'en_proceso', 'completado'),
    defaultValue: 'pendiente',
    allowNull: false, 
  },
  empleadosRequeridos: {
    type: DataTypes.INTEGER,
    allowNull: true // Permitimos valores nulos
  },
  empleadosAsignados: {
    type: DataTypes.JSON,
    allowNull: true // Permitimos valores nulos
  }
});

module.exports = Pedidos;