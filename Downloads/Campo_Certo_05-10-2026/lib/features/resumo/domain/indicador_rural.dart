import 'indicador_categoria.dart';

class IndicadorRural {
  const IndicadorRural({
    required this.id,
    required this.titulo,
    required this.valor,
    required this.unidade,
    required this.descricao,
    required this.categoria,
  });

  final String id;
  final String titulo;
  final String valor;
  final String unidade;
  final String descricao;
  final IndicadorCategoria categoria;
}
