
const Administrador = require("../models/Admin");
const Cliente =require("../models/Client");
const Empleado = require("../models/Empleado");
const Salas = require("../models/Salas");
const User = require("../models/User");
const Shows = require("../models/Shows");
const JefeSala = require("../models/JefeSala");
const Pedido = require("../models/Pedido");

const allowedTables = {
    admins: Administrador,
    clientes: Cliente,
    empleados: Empleado,
    salas: Salas,
    users: User,
    shows: Shows,
    jefesalas: JefeSala,
    pedidos:Pedido
  };
exports.tabla = async (req, res) => {
    const { tableId } = req.params;
    // Verificar si la tabla es permitida
    const Model = allowedTables[tableId.toLowerCase()];
    if (!Model) {
      return res.status(400).json({ error: "Tabla no permitida" });
    }
  
    try {
  let results;
  let columns;
  switch (tableId) {
    case "admins":
       results = await User.findAll({
        where:{
          role:"admin"
        }
      });
      console.log(Model);
      if (results.length === 0) {
        return res.status(404).json({ error: "No se encontraron datos" });
      }
  
       columns = results.length > 0 ? Object.keys(results[0].dataValues) : [];
  
      res.json({
        columns,
        rows: results,
      });
      break;
      case "clientes":
       results = await User.findAll({
        where:{
          role:"cliente"
        }
      });
      console.log(Model);
      if (results.length === 0) {
        return res.status(404).json({ error: "No se encontraron datos" });
      }
  
       columns = results.length > 0 ? Object.keys(results[0].dataValues) : [];
  
      res.json({
        columns,
        rows: results,
      });
      break; 
      case "empleados":
       results = await User.findAll({
        where:{
          role:"empleado"
        }
      });
      console.log(Model);
      if (results.length === 0) {
        return res.status(404).json({ error: "No se encontraron datos" });
      }
  
       columns = results.length > 0 ? Object.keys(results[0].dataValues) : [];
  
      res.json({
        columns,
        rows: results,
      });
      break; 

      case "jefesalas":
        results = await User.findAll({
         where:{
           role:"jefesala"
         }
       });
       console.log(Model);
       if (results.length === 0) {
         return res.status(404).json({ error: "No se encontraron datos" });
       }
   
        columns = results.length > 0 ? Object.keys(results[0].dataValues) : [];
   
       res.json({
         columns,
         rows: results,
       });
       break;
       case "shows":
        results = await Shows.findAll();
       console.log(Model);
       if (results.length === 0) {
         return res.status(404).json({ error: "No se encontraron datos" });
       }
   
        columns = results.length > 0 ? Object.keys(results[0].dataValues) : [];
   
       res.json({
         columns,
         rows: results,
       });
       break;


  
    default:
       results = await Model.findAll();
      console.log(Model);
      if (results.length === 0) {
        return res.status(404).json({ error: "No se encontraron datos" });
      }
  
       columns = results.length > 0 ? Object.keys(results[0].dataValues) : [];
  
      res.json({
        columns,
        rows: results,
      });
      break;
  }
      
    } catch (err) {
      return res.status(500).json({ error: "Error al consultar la base de datos" });
    }
  }

  exports.eliminarAdmin = async (req, res) => {
    try{

        const eliminar = Administrador.destroy({ where: { userId: req.params.id } });
        const eliUsu = User.destroy({
          where: { id: req.params.id }
        });

        if (eliminar == 0){
            return res.status(404).json({ message: 'Administrador no encontrado' });
        }
        res.status(204).send();
    } catch(error){
        res.status(500).json({error})
    }
}





