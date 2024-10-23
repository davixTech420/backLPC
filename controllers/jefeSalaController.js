
const User = require("../models/User");
const Salas = require("../models/Salas");
const JefeSala = require("../models/JefeSala");

exports.eliminarJefe = async (req, res) => {
  try {
    const { id } = req.params;
    const jefe = await JefeSala.destroy({ where: { userId: id } });
    const user = await User.destroy({ where: { id:id } });
    res.status(200).json({
      message: "Jefe eliminado exitosamente",
    });
  } catch (error) {
    res.status(500).json({ message: "Error eliminando el jefe" });
  }
};


exports.getJefe = async (req,res) => {
  try{
    const jefe = await User.findAll({
      where: { role: "jefesala"}
    });
    res.status(201).json(jefe);
}catch(error){
    res.status(500).json({
        message:"Ha Ocurrido Un Error Al Obtener Los Clientes"
    });
}   
}



exports.getJefeShowId = async (req,res) => {
  try {
    // Obtener la información del jefe de sala
    const jefe = await JefeSala.findOne({
      where: { userId: req.params.id }
    });

    // Verificar si el jefe de sala fue encontrado
    if (!jefe) {
      return res.status(404).json({ message: 'No se encontró un jefe de sala para este usuario.' });
    }

    // Obtener la sala correspondiente a salaId del jefe de sala
    const sala = await Salas.findOne({
      where: { id: jefe.salaId }
    });

    // Combinar los datos en un solo objeto
    const resultado = {
      jefe,
      sala
    };

    // Devolver la respuesta con el jefe de sala y la sala correspondiente
    res.status(200).json(resultado);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}


exports.getJefeId = async (req,res) => {
  const { salaId } = req.params;
  try {
    // Buscar el JefeSala que coincide con el salaId
    const jefeSala = await JefeSala.findOne({
      where: { salaId: salaId }
    });
    const resUser = await User.findByPk(jefeSala.userId);

    if (!jefeSala) {
      return res.status(404).json({ message: 'No se encontró un jefe para la sala proporcionada.' });
    }

    res.json(resUser);
  } catch (error) {
    
    res.status(500).json({ message: 'Error al obtener la información del jefe por sala.' });
  }
}

