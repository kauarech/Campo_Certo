enum IndicadorCategoria {
  producao('Produção'),
  custos('Custos'),
  rebanho('Rebanho'),
  area('Área');

  const IndicadorCategoria(this.label);

  final String label;
}
