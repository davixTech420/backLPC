const Salas = require("../models/Salas");
const JefeSala = require("../models/JefeSala");
const Pedido = require("../models/Pedido");
const { Op,fn,col } = require("sequelize");
const multer = require('multer');
const path = require('path');

exports.getSalas = async (req, res) => {
    try{
    const salas = await Salas.findAll();
    res.status(201).json(salas);
    }catch(error){
        res.status(500).json({message: error.message});
    }
};
exports.getSalaFavorita = async (req, res) => {
  try{
  Pedido.findAll({
    attributes: ['salaId', [fn('COUNT',col('salaId')), 'totalPedidos']],
    group: 'salaId',
    order: [[fn('COUNT',col('salaId')), 'DESC']],
    raw: true
  }).then(salas=>{
    Salas.findOne({
      where: {
        id: salas[0].salaId
      }
    }).then(sala=>{
      res.status(201).json(sala);
    })
  });
  }catch(error){
      res.status(500).json({message: error.message});
  }
};


exports.getSalasId = async (req, res) => {
    try{
const { id } = req.params;
    const salas = await Salas.findByPk(id);
    res.status(201).json(salas);
    }catch(error){
        res.status(500).json({message: error.message});
    }
};






exports.getSalasConJefe = async (req, res) => {
    try {
      // Obtener un array de IDs de salas que tienen un jefe asignado
      const salasConJefe = await JefeSala.findAll({
        attributes: ['salaId'],
        raw: true, // Devuelve solo los datos, no las instancias completas
      });
  
      // Extraer solo los IDs de las salas
      const salaIdsConJefe = salasConJefe.map(sala => sala.salaId);
  
      // Buscar salas que estén en el array de IDs con jefe asignado
      const salasConJefeAsignado = await Salas.findAll({
        where: {
          id: {
            [Op.in]: salaIdsConJefe.length > 0 ? salaIdsConJefe : [0], // Si no hay IDs, pasar un array que no filtre nada
          },
        },
      });
  
      res.status(201).json(salasConJefeAsignado);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  };






exports.getSalasSinJefe = async (req, res) => {
        try {
            // Obtener un array de IDs de salas que tienen un jefe asignado
            const salasConJefe = await JefeSala.findAll({
              attributes: ['salaId'],
              raw: true, // Devuelve solo los datos, no las instancias completas
            });
        
            // Extraer solo los IDs de las salas
            const salaIdsConJefe = salasConJefe.map(sala => sala.salaId);
        
            // Buscar salas que no estén en el array de IDs con jefe asignado
            const salasSinJefe = await Salas.findAll({
              where: {
                id: {
                  [Op.notIn]: salaIdsConJefe.length > 0 ? salaIdsConJefe : [0], // Si no hay IDs, pasar un array que no filtre nada
                },
              },
            });
        
            res.status(201).json(salasSinJefe);
          } catch (error) {
            res.status(500).json({ message: error.message });
          }
}





exports.updateSala = async (req, res) => {
    try{
        const { id } = req.params;
        const { imagen,nombre,direccion,capacidad,estado } = req.body;
        const salaActualizada = await Salas.update({imagen,nombre,direccion,capacidad,estado}, { where: { id: id } });

        if (salaActualizada[0] === 0) {
            return res.status(404).json({ message: 'Sala no encontrada' });
        }
        res.status(201).json({ message: 'Sala actualizada exitosamente' });
    }catch(error){
        res.status(500).json({message: error.message});
    }
}

/* exports.updateSala = async (req, res) => {
  try{
      const { id } = req.params;
      const { imagen,nombre,direccion,capacidad,estado } = req.body;
      const salaActualizada = await Salas.update({imagen,nombre,direccion,capacidad,estado}, { where: { id: id } });

      if (salaActualizada[0] === 0) {
          return res.status(404).json({ message: 'Sala no encontrada' });
      }
      res.status(201).json({ message: 'Sala actualizada exitosamente' });
  }catch(error){
      res.status(500).json({message: error.message});
  }
}
 */



/**este codigo es para subir la imagen en la ruta correcta */

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'public/images'); // Carpeta donde se guardarán las imágenes
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + '-' + file.originalname); // Nombre único para la imagen
  }
}); 
const upload = multer({ storage }).single('imagen');
exports.crearSala = async (req,res) => {
  upload(req, res, async (err) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: 'Error al subir la imagen' });
    }

    try {
      // Verifica si el archivo fue subido
      if (!req.file) {
        return res.status(400).json({ message: 'No se ha subido ninguna imagen' });
      }

      // Extraer datos del body
      const { nombre, direccion, capacidad} = req.body;
      // Obtener la URL de la imagen desde el archivo subido
      const imageUrl = `/images/${req.file.filename}`; // Construir la URL relativa a la imagen

      // Crear el show
      const resSala = await Salas.create({
        imagen: imageUrl,
        nombre,
        direccion,
        capacidad,
        estado:true,
      });
      // Responder con éxito
      res.status(201).json({
        resSala,
        message: "Sala Creado Exitosamente"
      });

    } catch (error) {
      console.error(error);
      res.status(500).json({ message: "Ha ocurrido un error al crear el show" });
    }
  });







   /*  const {imagen,nombre,direccion,capacidad,estado} = req.body;

    try{
    const nuevaSala = Salas.create({
        imagen,
        nombre,
        direccion,
        capacidad,
        estado
    });
    res.status(201).json({
        message: "Sala creada exitosamente",
    });
    }catch(error){
        res.status(500).json({message: error.message});
    } */
}
exports.eliminarSala = async (req, res) => {
    try{
        const eliminar = Salas.destroy({ where: { id: req.params.id } })
        if (eliminar == 0){
            return res.status(404).json({ message: 'Sala no encontrado' });
        }
        res.status(204).send();


    } catch(error){
        res.status(500).json({error})
    }

}