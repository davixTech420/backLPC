const Mensajes = require("../models/Mensaje");
const User = require("../models/User");
const sequelize = require("../config/database");
const { Op } = require('sequelize');


exports.crearMensaje = async (req, res) => {
try{
const { emisor,receptor,contenido,fechaEnvio } = req.body;
const nuevoMensaje = await Mensajes.create({
    emisor,
    receptor,
    contenido,
    fechaEnvio
});
res.status(201).json({message: "Mensaje Creado Exitosamente"});
}catch(error){
    res.status(500).json({message: error});
}
}

  exports.getDistinctReceiversBySender = async (req, res) => {
  







        const { emisorId } = req.params;
  
        try {






            
             const mensajes = await Mensajes.findAll({
                attributes: ['contenido', 'createdAt', 'receptor', 'emisor'],
                where: {
                    [Op.or]: [
                        { emisor: emisorId},
                        {receptor: emisorId}
                    ]
                },
               group: ['receptor', 'emisor'],
                include: [
                    {
                        model: User,
                        as: 'receptorUser',
                        attributes: ['nombre', 'apellido'],
                    },
                    {
                        model: User,
                        as: 'emisorUser',
                        attributes: ['nombre', 'apellido'],
                    }
                ]
            });
    
            res.json(mensajes); 
        } catch (error) {
            console.error('Error al obtener mensaje:', error);
            res.status(500).json({ message: 'Error al obtener mensajes de un usuario' });
        }
























  };



  exports.getConversacion = async (req, res) => {
      const { emisorId, receptorId } = req.params;
  
      try {
          const mensajes = await Mensajes.findAll({
              attributes: ['contenido', 'createdAt', 'receptor', 'emisor'],
              where: {
                  [Op.or]: [
                      { emisor: emisorId, receptor: receptorId },
                      { emisor: receptorId, receptor: emisorId }
                  ]
              },
              include: [
                  {
                      model: User,
                      as: 'receptorUser',
                      attributes: ['nombre', 'apellido'],
                  },
                  {
                      model: User,
                      as: 'emisorUser',
                      attributes: ['nombre', 'apellido'],
                  }
              ]
          });
  
          res.json(mensajes);
      } catch (error) {
          console.error('Error al obtener mensaje:', error);
          res.status(500).json({ message: 'Error al obtener mensajes' });
      }
  };