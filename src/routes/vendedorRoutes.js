import { Router } from 'express';
import * as controller from '../controllers/vendedorController.js';

const router = Router();

router.post('/', controller.cadastrar);
router.get('/', controller.listar);
router.get('/:id', controller.buscarPorId);
router.put('/:id', controller.atualizar);
router.patch('/:id/desativar', controller.desativar);

export default router;