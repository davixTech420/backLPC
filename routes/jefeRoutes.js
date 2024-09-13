const express = require("express");
const router = express.Router();
const mensajeController = require("../controllers/mensajeController");
const showController = require("../controllers/showController");
const jefeSalaController = require("../controllers/jefeSalaController");
const pedidoController = require("../controllers/pedidoController");


router.get("/jefe/:salaId", jefeSalaController.getJefeId);
router.post("/mensaje",mensajeController.crearMensaje);
router.get("/mensaje/:emisorId",mensajeController.getDistinctReceiversBySender);
router.get("/mensaje/:emisorId/:receptorId",mensajeController.getConversacion);
router.get("/jefeShowId/:id",jefeSalaController.getJefeShowId);
router.get("/showsMiSala/:id",showController.getShowsSala);
router.get("/pedido/:id",pedidoController.getPedidoForm);
router.put("/pedido/:id",pedidoController.activarPedido);
router.put("/inacPedido/:id",pedidoController.inactivarPedido);
router.delete("/pedido/:id",pedidoController.eliminarPedido);

module.exports = router;