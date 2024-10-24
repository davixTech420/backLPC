const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');
const salaController = require("../controllers/salasController");
const showsController = require("../controllers/showController");
const jefeSalaController = require("../controllers/jefeSalaController");

router.post('/register', authController.validarUsuario);
router.get('/registrarConfir/:token',authController.registrarConfirmado)
router.post('/login', authController.login);
router.get("/teatros",salaController.getSalasConJefe);
router.get("/shows",showsController.getShowsActivos);
router.get("/salas/:id",salaController.getSalasId);
router.get("/jefe/:salaId", jefeSalaController.getJefeId);
router.post("/forPass",authController.forgetPassword);
router.post("/resetPass",authController.resetPassword);

module.exports = router;



