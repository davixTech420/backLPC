const Salas = require("../models/Salas");
const User = require("../models/User");
const Shows = require("../models/Shows");
const multer = require('multer');
const path = require('path');




exports.getShows = async (req,res) => {
    try{
        const shows = await Shows.findAll();
        res.status(201).json(shows);
    }catch(error){
        res.status(500).json({
            message:"Ha Ocurrido Un Error Al Obtener Los Shows"+error
        });
    }   
}


exports.getShowsActivos = async (req,res) => {
    try{
        const shows = await Shows.findAll({
            where: {estado: true}
        });
        res.status(201).json(shows);
    }catch(error){
        res.status(500).json({
            message:"Ha Ocurrido Un Error Al Obtener Los Shows"+error
        });
    }   
}



exports.activarShow = async (req,res) => {
  try {
    const { id } = req.params;
    const showactivo = await Shows.update(
      { 
        estado:true
       }, 
      { where: { id :id} }
    );
    res.status(200).json({ message: 'Activado Con Exito' });
  } catch (error) {
    res.status(500).json({ error });
  }
}

exports.inactivarShow = async (req,res) => {
  try {
    const { id } = req.params;
    const showactivo = await Shows.update(
      { 
        estado:false
       }, 
      { where: { id :id} }
    );
    res.status(200).json({ message: 'Inactivado Con Exito' });
  } catch (error) {
    res.status(500).json({ error });
  }
}



/* esta es la funcion para subir las imagenes dentor de la carpte de back*/
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
      cb(null, 'public/images'); // Carpeta donde se guardarán las imágenes
    },
    filename: (req, file, cb) => {
      cb(null, Date.now() + '-' + file.originalname); // Nombre único para la imagen
    }
  });
  const upload = multer({ storage }).single('imagen');
  /**
   * 
   *  
   * 
   */

exports.crearShow = async (req,res) => {
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
      const { nombre, cuposDisponibles, fechaPresentar, horaInicio, horaFin, salaId } = req.body;

      // Obtener la URL de la imagen desde el archivo subido
      const imageUrl = `/images/${req.file.filename}`; // Construir la URL relativa a la imagen

      // Crear el show
      const resShow = await Shows.create({
        imagen: imageUrl,
        nombre,
        cuposDisponibles,
        fechaPresentar,
        horaInicio,
        horaFin,
        estado: false,
        salaId,
     
      });
      // Responder con éxito
      res.status(201).json({
       
        resShow,
        message: "Pedido Creado Exitosamente"
      });

    } catch (error) {
      console.error(error);
      res.status(500).json({ message: "Ha ocurrido un error al crear el show" });
    }
  });
}

exports.eliminarShow = async (req,res) => {
    try{
        const eliShow = await Shows.destroy({  
            where:{
                id: req.params.id}
        });

        res.status(200).json({
            message:"Se Ha Eliminado Exitosamente El Show"
        });
        
    }catch(error) {
        res.status(501).json({
            message:"Ha Ocurrido Un Error Al Eliminar El Show"
        });
    }
}


exports.getShowsSala = async (req,res) => {
    try{
    const miShows = await Shows.findAll({
      where: { salaId: req.params.id }
    })
    res.status(201).json(miShows);
    }catch(error){
    res.status(500).json({error})
    }
    }
    