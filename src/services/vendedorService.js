import pool from '../config/database.js';

export async function cadastrarVendedor({ nome, meta_mensal, percentual_base }) {
  if (!nome || meta_mensal < 0 || percentual_base < 0) {
    const error = new Error('Dados inválidos para cadastro de vendedor.');
    error.status = 400;
    throw error;
  }

  const [result] = await pool.execute(
    'INSERT INTO vendedores (nome, meta_mensal, percentual_base) VALUES (?, ?, ?)',
    [nome, meta_mensal, percentual_base]
  );

  return { id_vendedor: result.insertId, nome, meta_mensal, percentual_base, ativo: true };
}

export async function listarVendedores() {
  const [rows] = await pool.execute('SELECT * FROM vendedores');
  return rows;
}

export async function buscarVendedorPorId(id) {
  const [rows] = await pool.execute('SELECT * FROM vendedores WHERE id_vendedor = ?', [id]);
  if (rows.length === 0) {
    const error = new Error('Vendedor não encontrado.');
    error.status = 404;
    throw error;
  }
  return rows[0];
}

export async function atualizarVendedor(id, { meta_mensal, percentual_base }) {
  await buscarVendedorPorId(id);

  if (meta_mensal < 0 || percentual_base < 0) {
    const error = new Error('Valores de meta ou percentual base inválidos.');
    error.status = 400;
    throw error;
  }

  await pool.execute(
    'UPDATE vendedores SET meta_mensal = ?, percentual_base = ? WHERE id_vendedor = ?',
    [meta_mensal, percentual_base, id]
  );

  return buscarVendedorPorId(id);
}

export async function desativarVendedor(id) {
  await buscarVendedorPorId(id);

  await pool.execute(
    'UPDATE vendedores SET ativo = FALSE WHERE id_vendedor = ?',
    [id]
  );

  return { message: 'Vendedor desativado com sucesso.', id_vendedor: id };
}