const User = require("../models/User");
const Admin = require("../models/Admin");
const Cliente = require("../models/Client");
const Empleado = require("../models/Empleado");
const Jefe = require("../models/JefeSala");



exports.updateUser = async (req, res) => {
    try {
const { id } = req.params; // Obtener el ID del cliente desde los parámetros de la solicitud
const {
  nombre,
  apellido,
  tipIdentidad,
  identificacion,
  telefono,
  email,
  password,
  estado
} = req.body;

  // Actualizar el usuario
  const hashedPassword = await bcrypt.hash(password, 10);
  const usuarioActualizado = await User.update(
    { nombre,
      apellido,
      tipIdentidad,
      identificacion,
      telefono,
      email,
      password: hashedPassword,
      estado
     }, 
    { where: { id :id } } // Condición para encontrar el usuario
  );

  if (usuarioActualizado[0] === 0) {
    return res.status(404).json({ message: 'Usuario no encontrado' });
  }

  res.status(200).json({ message: 'Usuario actualizado con éxito' });
}catch(error) {
  res.status(500).json({
    message: error,
  });
}
}



/* este codigo es para cambiar el rol del usuario que ya haya registrado */
exports.changeRol = async (req,res) => {
  const { id,rol } = req.body;
  try {
    
  } catch (error) {
    res.status(500).json({
      message:error
    });
  }

  
}



