const User = require("../models/User");
const Empleado = require("../models/Empleado");


exports.eliminarEmpleado = async (req, res) => {
    try{

        const eliminar = Empleado.destroy({ where: { userId: req.params.id } });
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
exports.getEmpleadosSinShow = async (req, res) => {
try{
    const empleados = await Empleado.findAll({
        where:{ showId: null }
    });
    res.status(200).json(empleados);

}catch(error){
    res.status(500).json({error});
}
}
