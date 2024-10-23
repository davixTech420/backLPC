const multer = require('multer');
const path = require('path');
const Shows = require('../models/Shows');
const Pedidos = require('../models/Pedido');
const User = require("../models/User");
const Empleado = require("../models/Empleado");


exports.eliminarPedido = async (req, res) => {
  const { id } = req.params; // Obtener el ID del cliente desde los parámetros de la solicitud
  try {
    // Actualizar el usuario
   /*  const hashedPassword = await bcrypt.hash(password, 10); */
    const pedidoActualizado = await Pedidos.destroy(
      { where: { showId :id} } // Condición para encontrar el usuario
    );

    // Actualizar el cliente
    const clienteActualizado = await Shows.destroy(
      { where: { id: id } } // Condición para encontrar el cliente
    );
    res.status(200).json({ message: 'Eliminado Con Exito' });
  } catch (error) {
    res.status(500).json({ error });
  }
};

exports.activarPedido = async (req, res) => {
  const { id } = req.params; // Obtener el ID del cliente desde los parámetros de la solicitud
  try {
    // Actualizar el usuario
   /*  const hashedPassword = await bcrypt.hash(password, 10); */
    const pedidoActualizado = await Pedidos.update(
      { 
        estado:"completado"
       }, 
      { where: { showId :id} } // Condición para encontrar el usuario
    );

    // Actualizar el cliente
    const clienteActualizado = await Shows.update(
      {
         estado:true 
      }, // Campos a actualizar
      { where: { id: id } } // Condición para encontrar el cliente
    );

    

    res.status(200).json({ message: 'Activado Con Exito' });
  } catch (error) {
    res.status(500).json({ error });
  }
};

exports.inactivarPedido = async (req, res) => {
  const { id } = req.params; // Obtener el ID del cliente desde los parámetros de la solicitud
  try {
    // Actualizar el usuario
   /*  const hashedPassword = await bcrypt.hash(password, 10); */
    const pedidoActualizado = await Pedidos.update(
      { 
        estado:"pendiente"
       }, 
      { where: { showId :id} } // Condición para encontrar el usuario
    );

    // Actualizar el cliente
    const clienteActualizado = await Shows.update(
      {
         estado:false 
      }, // Campos a actualizar
      { where: { id: id } } // Condición para encontrar el cliente
    );

    

    res.status(200).json({ message: 'Inactivado Con Exito' });
  } catch (error) {
    res.status(500).json({ error });
  }
};


exports.getPedidoForm = async (req, res) => {
  try{
    const { id } = req.params;
    const pedido = await Pedidos.findAll({ where: { showId:id } });
    res.status(200).json(pedido);
  }catch(error){
    res.status(500).json({
      message: 'Error al obtener el formulario de pedido',
    })
  }
}


// Configuración de Multer
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
      cb(null, 'public/images'); // Carpeta donde se guardarán las imágenes
    },
    filename: (req, file, cb) => {
      cb(null, Date.now() + '-' + file.originalname); // Nombre único para la imagen
    }
  });
  const upload = multer({ storage }).single('imagen'); // Usar multer para un solo archivo 'imagen'
  
  exports.crearPedido = async (req, res) => {
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
        const { nombre, cuposDisponibles, fechaPresentar, horaInicio, horaFin, salaId, clienteId, empleadosRequeridos } = req.body;
  
        // Obtener la URL de la imagen desde el archivo subido
        const imageUrl = `/images/${req.file.filename}`; // Construir la URL relativa a la imagen
  

        const existingPedido = await Shows.findOne({
          where: {
            salaId,
            fechaPresentar,
            horaInicio
          }
        });
  
        if (existingPedido) {
          return res.status(400).json({ message: 'Ya existe un pedido con la misma sala, fecha y hora' });
        }
  
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
          clienteId
        });
  
        // Crear el pedido asociado
        const resPedi = await Pedidos.create({
          showId: resShow.id,
          salaId,
          estado: "pendiente",
          empleadosRequeridos,
          empleadosAsignados: 0
        });
  
        // Responder con éxito
        res.status(201).json({
          resPedi,
          resShow,
          message: "Pedido Creado Exitosamente"
        });
  
      } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Ha ocurrido un error al crear el show" });
      }
    });
  };



/**
 * 
 * 
 * asignar empleados a un pedido
 * 
 * 
 */

exports.asignarEmpleado = async (req, res) => {
  const { idEmpleado, idShow } = req.params; // Obtener el ID del cliente desde los parámetros de la solicitud
  try {
    // Actualizar el usuario
   /*  const hashedPassword = await bcrypt.hash(password, 10); */
    const pedidoActualizado = await Pedidos.update(
      { 
        estado:"pendiente"
       }, 
      { where: { showId :id} } // Condición para encontrar el usuario
    );

    // Actualizar el cliente
    const clienteActualizado = await Shows.update(
      {
         estado:false 
      }, // Campos a actualizar
      { where: { id: id } } // Condición para encontrar el cliente
    );

    

    res.status(200).json({ message: 'Inactivado Con Exito' });
  } catch (error) {
    res.status(500).json({ error });
  }
};


/**
 * 
 * 
 * 
 */
  
  