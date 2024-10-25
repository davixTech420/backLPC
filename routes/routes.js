 const express = require("express");
const router = express.Router();
const userController = require("../controllers/userController");
const salasController = require("../controllers/salasController");
const adminController = require("../controllers/adminController");
const clienteController = require("../controllers/clienteController");
const empleadoController = require("../controllers/empleadoController");
const showController = require("../controllers/showController");
const jefeSalaController = require("../controllers/jefeSalaController");
const pedidoController = require("../controllers/pedidoController");

router.get("/dashboard",clienteController.getCliente);




router.put("/user/:id", userController.updateUser);
router.put("/userChangeRol/:id/:rol", userController.changeRol);
router.put("/userInact/:id", userController.inactiveUser);
router.put("/userAct/:id", userController.activeUser);



/***
 * 
 * 
 * 
 * 
 * 
 */
router.put("/pedidoACT/:id",pedidoController.activarPedido);
router.put("/pedidoINA/:id",pedidoController.inactivarPedido);
router.delete("/pedido/:id",pedidoController.eliminarPedido);

/*


* */

/* * *
*
**estas son las rutas para la crud de la tabla salas *
*
*
*
*/

router.post("/sala",salasController.crearSala);
router.get("/sala", salasController.getSalas);
router.delete("/sala/:id",salasController.eliminarSala);
router.put("/sala/:id", salasController.updateSala);
router.get("/salaSin",salasController.getSalasSinJefe);
router.get("/salaCon",salasController.getSalasConJefe);

/**
 * 
 * 
 */
/* * *
*
**estas son las rutas para la crud de la tabla shows *
*
*
*
*/  
router.post("/show",showController.crearShow);
router.delete("/show/:id",showController.eliminarShow);
router.put("/showAct/:id",showController.activarShow);
router.put("/showIna/:id",showController.inactivarShow);
/**
 * 
 * 
 */

/*
*
*
*
** estas son las rutas de la crud del Administrador **
*
*
*
*/
router.delete("/admins/:id",adminController.eliminarAdmin);
/**
 * 
 * 
 * 
 */

/*
*
*
*
** estas son las rutas de la crud del Cliente **
*
*
*
*/
router.delete("/clientes/:id",clienteController.eliminarCliente);
router.put("/clientes/:id", clienteController.actualizarCliente);
/**
 * 
 * 
 * 
 */

/*
*
*
*
** estas son las rutas de la crud del Empleado**
*
*
*
*/
router.delete("/empleados/:id", empleadoController.eliminarEmpleado);
/**
 * 
 * 
 * 
 */

/*
*
*
*
** estas son las rutas de la crud del jefe de la sala**
*
*
*
*/
router.delete("/jefe/:id", jefeSalaController.eliminarJefe);
router.get("/jefe",jefeSalaController.getJefe);
/**
 * 
 * 
 */ 
router.get("/tabla/:tableId",adminController.tabla );



module.exports = router;
