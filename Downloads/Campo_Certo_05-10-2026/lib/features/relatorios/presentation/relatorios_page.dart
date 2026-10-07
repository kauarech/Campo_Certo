import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class RelatoriosPage extends StatelessWidget {
  const RelatoriosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatórios'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 900,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Relatórios da Propriedade',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.verdeEscuro,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Consulte informações e acompanhe os resultados da propriedade.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 30),

                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: const [
                    CardRelatorio(
                      icone: Icons.agriculture,
                      titulo: 'Produção',
                      descricao:
                          'Visualize informações relacionadas à produção.',
                    ),
                    CardRelatorio(
                      icone: Icons.attach_money,
                      titulo: 'Custos',
                      descricao:
                          'Acompanhe os gastos registrados na propriedade.',
                    ),
                    CardRelatorio(
                      icone: Icons.trending_up,
                      titulo: 'Resultados',
                      descricao:
                          'Compare informações e acompanhe o desempenho.',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardRelatorio extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;

  const CardRelatorio({
    super.key,
    required this.icone,
    required this.titulo,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),

              Icon(
                icone,
                size: 38,
                color: AppTheme.amarelo,
              ),

              const SizedBox(height: 18),

              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                descricao,
                style: const TextStyle(
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}