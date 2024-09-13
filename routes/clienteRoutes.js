const express = require("express");
const router = express.Router();
const mensajeController = require("../controllers/mensajeController");
const clienteController = require("../controllers/clienteController");
const jefeSalaController = require("../controllers/jefeSalaController");
const pedidoController = require("../controllers/pedidoController");
const salasController = require("../controllers/salasController");

router.get("/clienteLogeado",clienteController.getClienteLogeado);
router.put("/cliente/:id", clienteController.actualizarCliente);
router.get("/clienForm/:userId", clienteController.getClienteId);
router.get("/jefe/:salaId", jefeSalaController.getJefeId);
router.post("/mensaje",mensajeController.crearMensaje);
router.get("/mensaje/:emisorId",mensajeController.getDistinctReceiversBySender);
router.get("/mensaje/:emisorId/:receptorId",mensajeController.getConversacion);

/*funciones de pedidos*/ 
router.post("/pedido",pedidoController.crearPedido);
router.delete("/pedido/:id",pedidoController.eliminarPedido);
/**/
router.get("/misShows/:id",clienteController.getShowsCliente);
router.get("/salaCon",salasController.getSalasConJefe);



module.exports = router;