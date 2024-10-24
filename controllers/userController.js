const User = require("../models/User");
const Cliente = require("../models/Client");
const Empleado = require("../models/Empleado");
const Jefe = require("../models/JefeSala");
const Show = require("../models/Shows");
const Sala = require("../models/Salas");
const { Op } = require('sequelize');


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
      {
        nombre,
        apellido,
        tipIdentidad,
        identificacion,
        telefono,
        email,
        password: hashedPassword,
        estado
      },
      { where: { id: id } } // Condición para encontrar el usuario
    );

    if (usuarioActualizado[0] === 0) {
      return res.status(404).json({ message: 'Usuario no encontrado' });
    }

    res.status(200).json({ message: 'Usuario actualizado con éxito' });
  } catch (error) {
    res.status(500).json({
      message: error,
    });
  }
}



/* este codigo es para cambiar el rol del usuario que ya haya registrado */

exports.changeRol = async (req, res) => {
  const { id, rol } = req.params;

  try {
    const user = await User.findByPk(id);

    if (!user || user.role === rol) {
      return res.status(404).json({ message: 'Usuario no encontrado o Rol no válido' });
    }

    // Funciones de validación para roles
    const hasShowsAsCliente = async () => {
      const showsCliente = await Show.count({ where: { clienteId: id } });
      return showsCliente > 0;
    };

    const hasShowsAsEmpleado = async () => {
      const showsEmpleado = await Empleado.count({ where: { userId: id, showId: { [Op.ne]: null } } });
      return showsEmpleado > 0;
    };

    const hasSalasAsJefeSala = async () => {
      const salas = await Jefe.count({ where: { userId: id, salaId: { [Op.ne]: null } } });
      return salas > 0;
    };

    // Cambiar el rol según el nuevo rol solicitado
    switch (rol) {
      case "empleado":
        if (await hasShowsAsCliente()) {
          return res.status(400).json({ message: 'Cliente no puede tener shows asignados' });
        }
        if (await hasShowsAsEmpleado()) {
          return res.status(400).json({ message: 'Empleado no puede tener shows asignados' });
        }
        if (await hasSalasAsJefeSala()) {
          return res.status(400).json({ message: 'Jefe de sala no puede tener salas asignadas' });
        }
        await Empleado.create({ userId: id });
        await Cliente.destroy({ where: { userId: id } });
        await Jefe.destroy({ where: { userId: id } });
        break;

      case "cliente":
        if (await hasShowsAsCliente()) {
          return res.status(400).json({ message: 'Cliente no puede tener shows creados' });
        }
        if (await hasShowsAsEmpleado()) {
          return res.status(400).json({ message: 'Empleado no puede tener shows asignados' });
        }
        if (await hasSalasAsJefeSala()) {
          return res.status(400).json({ message: 'Jefe de sala no puede tener salas asignadas' });
        }
        await Cliente.create({ userId: id });
        await Empleado.destroy({ where: { userId: id } });
        await Jefe.destroy({ where: { userId: id } });
        break;

      case "jefeSala":
        if (await hasShowsAsCliente()) {
          return res.status(400).json({ message: 'Cliente no puede tener shows asignados' });
        }
        if (await hasShowsAsEmpleado()) {
          return res.status(400).json({ message: 'Empleado no puede tener shows asignados' });
        }
        if (await hasSalasAsJefeSala()) {
          return res.status(400).json({ message: 'Jefe de sala no puede tener salas asignadas' });
        }
        await Jefe.create({ userId: id });
        await Cliente.destroy({ where: { userId: id } });
        await Empleado.destroy({ where: { userId: id } });
        break;

      default:
        return res.status(400).json({ message: 'Rol no reconocido' });
    }

    // Actualiza el rol del usuario
    user.role = rol;
    await user.save();
    res.status(200).json({ message: 'Rol cambiado exitosamente' });

  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};