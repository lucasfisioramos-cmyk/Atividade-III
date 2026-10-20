import * as vendedorService from '../services/vendedorService.js';

export async function cadastrar(req, res, next) {
  try {
    const novoVendedor = await vendedorService.cadastrarVendedor(req.body);
    res.status(201).json(novoVendedor);
  } catch (error) { next(error); }
}

export async function listar(req, res, next) {
  try {
    const vendedores = await vendedorService.listarVendedores();
    res.status(200).json(vendedores);
  } catch (error) { next(error); }
}

export async function buscarPorId(req, res, next) {
  try {
    const vendedor = await vendedorService.buscarVendedorPorId(req.params.id);
    res.status(200).json(vendedor);
  } catch (error) { next(error); }
}

export async function atualizar(req, res, next) {
  try {
    const atualizado = await vendedorService.atualizarVendedor(req.params.id, req.body);
    res.status(200).json(atualizado);
  } catch (error) { next(error); }
}

export async function desativar(req, res, next) {
  try {
    const resultado = await vendedorService.desativarVendedor(req.params.id);
    res.status(200).json(resultado);
  } catch (error) { next(error); }
}