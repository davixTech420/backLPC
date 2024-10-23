// index.js
const express = require('express');
const bodyParser = require('body-parser');
const sequelize = require('./config/database');
const authRoutes = require('./routes/auth');
const Mensajes = require("./models/Mensaje");
const Cliente = require('./models/Client');
const Empleado =require('./models/Empleado');
const Salas = require('./models/Salas');
const Shows = require("./models/Shows");
const Pedido = require("./models/Pedido");
const routesAdmin = require('./routes/routes');
const routesCliente = require('./routes/clienteRoutes');
const routesJefe = require('./routes/jefeRoutes');
const cors = require('cors');
const authMiddleware = require('./middleware/authMiddleware');
const roleMiddleware = require('./middleware/roleMiddleware');
const port = 3001;

require('dotenv').config();
const app = express();

app.use(cors());
app.use(bodyParser.json());
app.use("/images",express.static("public/images"));
app.use('/api/auth', authRoutes);
app.use('/api/admin', authMiddleware,roleMiddleware('admin'), routesAdmin);
app.use('/api/cliente',authMiddleware,roleMiddleware('cliente'),routesCliente);
app.use('/api/jefe', authMiddleware,roleMiddleware('jefesala'),routesJefe);
app.use('/api/empleado', authMiddleware,roleMiddleware('empleado'));


//ojo con el force siempre debe estar en false para no eliminar los datos 
sequelize.sync({ force:false,alter:false }).then(() => {
  app.listen(port, () => {
    console.log('Servidor corriendo en el puerto ', port);
  });
}).catch(error => {
  console.error('Error al sincronizar la base de datos:', error);
});