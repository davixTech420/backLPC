// controllers/authController.js
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const nodemailer = require('nodemailer');
const { google } = require("googleapis");
const User = require("../models/User");
const Administrador = require("../models/Admin");
const Cliente = require("../models/Client");
const Empleado = require("../models/Empleado");
const JefeSala = require("../models/JefeSala");



exports.register = async (req, res) => {
  const { nombre, apellido, tipIdentidad, identificacion, telefono, email, password, estado, role } = req.body;
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
        try {

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
        } catch (error) {
          res.status(500).json({ message: "Error registrando Admin", error });
        }

        break;
      case "cliente":
        try {
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
        } catch (error) {
          res.status(500).json({ message: "Error registrando Cliente", error });
        }

        break;
      case "empleado":
        try {
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
        } catch (error) {
          res.status(500).json({ message: "Error registrando empleado", error });
        }
        break;
      case "jefesala":
        try {
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
        } catch (error) {
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
    res.json({ token, role: user.role });
  } catch (error) {
    res.status(500).json({ message: "Error en el login", error });
  }
};









/* este codigo es para generar el restbaecimiento de contraseña que se envia al email */
exports.forgetPassword = async (req, res) => {
  const { email } = req.body;

  try {
    const user = await User.findOne({ where: { email } });
    if (!user) {
      return res.status(404).json({ message: 'El correo no está registrado' });
    }


    // Generar un token con expiración
    const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET, { expiresIn: '5m' });

    // Crear enlace de restablecimiento de contraseña
    const resetLink = `http://localhost:3000/resetPass/${token}`;

    /*autenticacion para enviar los gmails*/
    const oAuth2Client = new google.auth.OAuth2(process.env.GOOGLE_CLIENT_ID, process.env.GOOGLE_CLIENT_SECRET, process.env.GOOGLE_REDIRECT_URI);
    oAuth2Client.setCredentials({ refresh_token: process.env.GOOGLE_REFRESH_TOKEN });

    const accessToken = await oAuth2Client.getAccessToken();


    // Configurar nodemailer con OAuth2
    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        type: 'OAuth2',
        user: 'cristhiandavidamaya93@gmail.com', // El correo electrónico que envía
        clientId: process.env.GOOGLE_CLIENT_ID,
        clientSecret: process.env.GOOGLE_CLIENT_SECRET,
        refreshToken: process.env.GOOGLE_REFRESH_TOKEN,
        accessToken: accessToken.token,
      },
    });

    // Enviar el correo al usuario
    const mailOptions = {
      from: process.env.EMAIL_USER,
      to: email,
      subject: 'Restablecimiento de contraseña',
      html: `<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 24px;
            color: #333;
        }
        p {
            font-size: 16px;
            color: #666;
            line-height: 1.6;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            font-size: 16px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .footer {
            margin-top: 30px;
            text-align: center;
            font-size: 12px;
            color: #999;
        }
        .footer p {
            margin: 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Restablecer tu contraseña</h1>
        <p>Hola,</p>
        <p>Recibimos una solicitud para restablecer tu contraseña. Haz clic en el botón de abajo para restablecerla:</p>
        <a href="${resetLink}" class="button">Restablecer contraseña</a>
        <p>Este enlace expirará en 1 hora. Si no solicitaste este cambio, puedes ignorar este correo.</p>
        <div class="footer">
            <p>&copy; 2024 Datech. Todos los derechos reservados.</p>
        </div>
    </div>
</body>
</html>
`,
    };

    await transporter.sendMail(mailOptions);

    res.status(200).json({ message: 'Correo Enviado Con Exito' })
  } catch (error) {
    res.status(500).json(error.message);
  }
}







/* cambiar la contraseña */

exports.resetPassword = async (req, res) => {
  const { password, token } = req.body;

  try {
    // Verificar y decodificar el token
    const decoded = jwt.verify(token, process.env.JWT_SECRET);

    // Buscar el usuario por ID
    const user = await User.findByPk(decoded.id);
    if (!user) {
      return res.status(404).json({ message: 'Usuario no encontrado' });
    }

    // Actualizar la contraseña del usuario
    const hashedPassword = await bcrypt.hash(password, 10); // Encriptar la nueva contraseña
    user.password = hashedPassword;
    await user.save();

    res.status(200).json({ success: true, message: 'Contraseña actualizada correctamente' });
  } catch (error) {
    return res.status(500).json({ message: 'El enlace es inválido o ha expirado' });
  }
};