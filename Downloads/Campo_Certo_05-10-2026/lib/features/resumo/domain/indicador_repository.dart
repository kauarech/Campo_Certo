import 'indicador_rural.dart';

abstract interface class IndicadorRepository {
  Future<List<IndicadorRural>> fetchResumo();
}
