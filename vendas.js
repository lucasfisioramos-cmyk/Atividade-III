class Venda {
  constructor({ id, valor, data = new Date(), vendedorId }) {
    if (valor <= 0) {
      throw new Error('O valor da venda deve ser maior que zero.');
    }
    this.id = id;
    this.valor = valor;
    this.data = data;
    this.vendedorId = vendedorId;
  }
}

export default Venda;