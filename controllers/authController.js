// controllers/authController.js
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const User = require("../models/User");

const Administrador = require("../models/Admin");
const Cliente = require("../models/Client");
const Empleado = require("../models/Empleado");
const JefeSala = require("../models/JefeSala");


exports.register = async (req, res) => {
  const { nombre,apellido, tipIdentidad, identificacion, telefono, email, password,estado, role } = req.body;

  

  try {
    const hashedPassword = await bcrypt.hash(password, 10);
    const newUser = await User.create({
      nombre,
      apellido,
      tipIdentidad,
      identificacion,
      telefono,
      email,
      password: hashedPassword,
      estado,
      role,
    });
    switch (role) {
      case "admin":
      try{
       
        const Admin = await Administrador.create({
          userId: newUser.id,
        });
        res
          .status(201)
          .json({
            message: "Usuario registrado exitosamente",
            user: newUser,
            userAdmin: Admin,
          });
        }catch(error){
          res.status(500).json({ message: "Error registrando Admin", error });
        }

        break;
      case "cliente":
        try{
          const Clien = await Cliente.create({
            nacionCliente: req.body.nacionCliente,
            direccion: req.body.direccion,
            userId: newUser.id,
          });
          res
            .status(201)
            .json({
              message: "Usuario registrado exitosamente",
              user: newUser,
              userClient: Clien,
            });
          }catch(error){
            res.status(500).json({ message: "Error registrando Cliente", error });
          }

        break;
      case "empleado":
        try{
          const empleado = await Empleado.create({
            userId: newUser.id,
          });
          res
            .status(201)
            .json({
              message: "Usuario registrado exitosamente",
              user: newUser,
              userEmple: empleado,
            });
          }catch(error){
            res.status(500).json({ message: "Error registrando empleado", error });
          }
        break;
        case "jefesala":
        try{
          const jefe = await JefeSala.create({
            userId: newUser.id,
            salaId: req.body.salaId
          });
          res
            .status(201)
            .json({
              message: "Jefe registrado exitosamente",
              user: newUser,
              userJefe: jefe,
            });
          }catch(error){
            res.status(500).json({ message: "Error registrando Jefe De Sala", error });
          }
        break;
      default:
        res
          .status(500)
          .json({ message: "Error registrando usuario Rol No Valido", error });
        break;
    }
  } catch (error) {
    res.status(500).json({ message: "Error registrando usuario", error });
  }
};

exports.login = async (req, res) => {
  const { email, password } = req.body;

  try {
    const user = await User.findOne({ where: { email } });
    if (!user) {
      return res.status(401).json({ message: "Usuario no encontrado" });
    }

    const isPasswordValid = bcrypt.compareSync(password, user.password);
    if (!isPasswordValid) {
      return res.status(401).json({ message: "Contraseña incorrecta" });
    }

    const token = jwt.sign(
      { id: user.id, role: user.role },
      process.env.JWT_SECRET,
      { expiresIn: "5h" }
    );
    res.json({ token, role:user.role });
  } catch (error) {
    res.status(500).json({ message: "Error en el login", error });
  }
};
