import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_theme.dart';

import '../../custos/presentation/custos_page.dart';
import '../../producao/presentation/producao_page.dart';
import '../../relatorios/presentation/relatorios_page.dart';

import '../../resumo/domain/indicador_categoria.dart';
import '../../resumo/domain/indicador_repository.dart';
import '../../resumo/domain/indicador_rural.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.repository,
  });

  final IndicadorRepository repository;

  static const double maxContentWidth = 1000;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<IndicadorRural>> _indicadoresFuture;

  @override
  void initState() {
    super.initState();
    _indicadoresFuture = widget.repository.fetchResumo();
  }

  void _recarregar() {
    setState(() {
      _indicadoresFuture = widget.repository.fetchResumo();
    });
  }

  Future<void> _refresh() async {
    _recarregar();

    try {
      await _indicadoresFuture;
    } catch (_) {
      // O erro já é exibido pelo FutureBuilder.
    }
  }

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.sizeOf(context).width;

    final espacamentoHorizontal = math.max(
      AppSpacing.lg,
      (larguraTela - HomePage.maxContentWidth) / 2,
    );

    return RefreshIndicator(
      onRefresh: _refresh,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 36,
                ),
                const SizedBox(width: AppSpacing.sm),
                const Text(
                  'CampoCerto',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              espacamentoHorizontal,
              AppSpacing.lg,
              espacamentoHorizontal,
              0,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  _cabecalho(),
                  const SizedBox(height: AppSpacing.xl),
                  const Text(
                    'O que você deseja acessar?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.verdeEscuro,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _atalhos(),
                  const SizedBox(height: AppSpacing.xl),
                  const Text(
                    'Resumo da propriedade',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.verdeEscuro,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              espacamentoHorizontal,
              0,
              espacamentoHorizontal,
              AppSpacing.xl,
            ),
            sliver: SliverToBoxAdapter(
              child: _buildResumo(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cabecalho() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.md),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 120,
          ),
          const SizedBox(height: AppSpacing.md),
          const Text(
            'Bem-vindo ao CampoCerto',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.verdeEscuro,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'Organize e acompanhe sua produção rural de forma simples e prática.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _atalhos() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          return const Column(
            children: [
              OpcaoCampo(
                icone: Icons.agriculture,
                titulo: 'Produção',
                descricao:
                    'Acompanhe as informações da produção da propriedade.',
                cor: AppTheme.verdeEscuro,
                pagina: ProducaoPage(),
              ),
              SizedBox(height: AppSpacing.md),
              OpcaoCampo(
                icone: Icons.attach_money,
                titulo: 'Custos',
                descricao: 'Registre e acompanhe os principais gastos.',
                cor: AppTheme.verdeClaro,
                pagina: CustosPage(),
              ),
              SizedBox(height: AppSpacing.md),
              OpcaoCampo(
                icone: Icons.bar_chart,
                titulo: 'Relatórios',
                descricao: 'Visualize resultados e informações importantes.',
                cor: AppTheme.amarelo,
                pagina: RelatoriosPage(),
              ),
            ],
          );
        }

        return const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: OpcaoCampo(
                icone: Icons.agriculture,
                titulo: 'Produção',
                descricao:
                    'Acompanhe as informações da produção da propriedade.',
                cor: AppTheme.verdeEscuro,
                pagina: ProducaoPage(),
              ),
            ),
            SizedBox(width: AppSpacing.md),
            Expanded(
              child: OpcaoCampo(
                icone: Icons.attach_money,
                titulo: 'Custos',
                descricao: 'Registre e acompanhe os principais gastos.',
                cor: AppTheme.verdeClaro,
                pagina: CustosPage(),
              ),
            ),
            SizedBox(width: AppSpacing.md),
            Expanded(
              child: OpcaoCampo(
                icone: Icons.bar_chart,
                titulo: 'Relatórios',
                descricao: 'Visualize resultados e informações importantes.',
                cor: AppTheme.amarelo,
                pagina: RelatoriosPage(),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildResumo() {
    return FutureBuilder<List<IndicadorRural>>(
      future: _indicadoresFuture,
      builder: (context, snapshot) {
        final carregando = snapshot.connectionState != ConnectionState.done &&
            !snapshot.hasData;

        if (carregando) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.xl),
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.cloud_off_outlined,
                  size: 48,
                  color: AppTheme.verdeEscuro,
                ),
                const SizedBox(height: AppSpacing.md),
                const Text(
                  'Não foi possível carregar o resumo da propriedade.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.md),
                ElevatedButton(
                  onPressed: _recarregar,
                  child: const Text('Tentar novamente'),
                ),
              ],
            ),
          );
        }

        final indicadores = snapshot.data ?? const <IndicadorRural>[];

        if (indicadores.isEmpty) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.inbox_outlined,
                  size: 48,
                  color: AppTheme.verdeEscuro,
                ),
                SizedBox(height: AppSpacing.md),
                Text(
                  'Ainda não há informações para exibir.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            double largura = 220;

            if (constraints.maxWidth < 600) {
              largura = constraints.maxWidth;
            }

            return Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.md,
              children: indicadores.map((indicador) {
                return SizedBox(
                  width: largura,
                  child: CardIndicador(
                    indicador: indicador,
                  ),
                );
              }).toList(),
            );
          },
        );
      },
    );
  }
}

class OpcaoCampo extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;
  final Color cor;
  final Widget pagina;

  const OpcaoCampo({
    super.key,
    required this.icone,
    required this.titulo,
    required this.descricao,
    required this.cor,
    required this.pagina,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppRadius.md),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.md),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => pagina,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icone,
                size: 40,
                color: cor,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.verdeEscuro,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                descricao,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              const Row(
                children: [
                  Text(
                    'Acessar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.verdeEscuro,
                    ),
                  ),
                  SizedBox(width: AppSpacing.sm),
                  Icon(
                    Icons.arrow_forward,
                    size: 18,
                    color: AppTheme.verdeEscuro,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardIndicador extends StatelessWidget {
  const CardIndicador({
    super.key,
    required this.indicador,
  });

  final IndicadorRural indicador;

  IconData _iconeCategoria() {
    switch (indicador.categoria) {
      case IndicadorCategoria.producao:
        return Icons.agriculture;

      case IndicadorCategoria.custos:
        return Icons.attach_money;

      case IndicadorCategoria.rebanho:
        return Icons.pets;

      case IndicadorCategoria.area:
        return Icons.landscape;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              _iconeCategoria(),
              size: 34,
              color: AppTheme.verdeEscuro,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              indicador.titulo,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              '${indicador.valor} ${indicador.unidade}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.verdeEscuro,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              indicador.descricao,
              style: const TextStyle(
                color: Colors.black54,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
