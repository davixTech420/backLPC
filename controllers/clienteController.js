const User = require("../models/User");
const Cliente = require("../models/Client");
const Shows = require("../models/Shows");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");


exports.getClienteId = async (req,res) => {
  try{
    const { userId } = req.params;
    const cliente = await Cliente.findOne({
      where: { userId: userId}
    });
    res.status(201).json(cliente);
}catch(error){
    res.status(500).json({
        message:"Ha Ocurrido Un Error Al Obtener Los Clientes",
        error
    });
}   
}




exports.getCliente = async (req,res) => {
  try{
    const cliente = await User.findAll({
      where: { role: "cliente"}
    });
    res.status(201).json(cliente);
}catch(error){
    res.status(500).json({
        message:"Ha Ocurrido Un Error Al Obtener Los Clientes"
    });
}   
}

exports.actualizarCliente = async (req, res) => {
  const { id } = req.params; // Obtener el ID del cliente desde los parámetros de la solicitud
  const {
    nombre,
    apellido,
    tipIdentidad,
    identificacion,
    telefono,
    email,
    nacionCliente,
    direccion

  } = req.body; 

  try {
    // Actualizar el usuario
   /*  const hashedPassword = await bcrypt.hash(password, 10); */
    const usuarioActualizado = await User.update(
      { nombre,
        apellido,
        tipIdentidad,
        identificacion,
        telefono,
        email,
  /*       password: hashedPassword */
       }, 
      { where: { id :id} } // Condición para encontrar el usuario
    );

    if (usuarioActualizado[0] === 0) {
      return res.status(404).json({ message: 'Usuario no encontrado' });
    }

    // Actualizar el cliente
    const clienteActualizado = await Cliente.update(
      { nacionCliente, direccion }, // Campos a actualizar
      { where: { userId: id } } // Condición para encontrar el cliente
    );

    if (clienteActualizado[0] === 0) {
      return res.status(404).json({ message: 'Cliente no encontrado' });
    }

    res.status(200).json({ message: 'Cliente y usuario actualizados con éxito' });
  } catch (error) {
    res.status(500).json({ error });
  }
};


exports.eliminarCliente = async (req, res) => {
    try{

        const eliminar = Cliente.destroy({ where: { userId: req.params.id } });
        const eliUsu = User.destroy({
          where: { id: req.params.id }
        });

        if (eliminar == 0){
            return res.status(404).json({ message: 'Cliente no encontrado' });
        }
        res.status(204).send();
    } catch(error){
        res.status(500).json({error})
    }
}





exports.getClienteLogeado = async (req,res) => {
    const token = req.headers.authorization;
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const userId = decoded.id;
  
    try {
      const cliente = await User.findByPk(userId);
      
      if (!cliente) {
        return res.status(404).json({ message: "Cliente no encontrado" });
      }


      res.json(cliente);
    } catch (error) {
      res.status(500).json({ message: "Error al obtener el cliente", error });
    }
}




exports.getShowsCliente = async (req,res) => {
try{
const miShows = await Shows.findAll({
  where: { clienteId: req.params.id }
})
res.status(201).json(miShows);
}catch(error){
res.status(500).json({error})
}
}
