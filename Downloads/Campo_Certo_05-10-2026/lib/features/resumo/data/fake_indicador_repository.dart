import '../domain/indicador_categoria.dart';
import '../domain/indicador_repository.dart';
import '../domain/indicador_rural.dart';

class FakeIndicadorRepository implements IndicadorRepository {
  const FakeIndicadorRepository({
    this.delay = const Duration(milliseconds: 800),
  });

  final Duration delay;

  static const List<IndicadorRural> _indicadores = [
    IndicadorRural(
      id: '1',
      titulo: 'Produção diária',
      valor: '180',
      unidade: 'L/dia',
      descricao: 'Produção registrada no período atual.',
      categoria: IndicadorCategoria.producao,
    ),
    IndicadorRural(
      id: '2',
      titulo: 'Custos do mês',
      valor: '8.350',
      unidade: 'R\$',
      descricao: 'Total aproximado de custos registrados.',
      categoria: IndicadorCategoria.custos,
    ),
    IndicadorRural(
      id: '3',
      titulo: 'Animais',
      valor: '22',
      unidade: 'cabeças',
      descricao: 'Quantidade atual de animais cadastrados.',
      categoria: IndicadorCategoria.rebanho,
    ),
    IndicadorRural(
      id: '4',
      titulo: 'Área produtiva',
      valor: '4,5',
      unidade: 'ha',
      descricao: 'Área utilizada para produção na propriedade.',
      categoria: IndicadorCategoria.area,
    ),
  ];

  @override
  Future<List<IndicadorRural>> fetchResumo() async {
    await Future<void>.delayed(delay);

    return _indicadores;
  }
}
