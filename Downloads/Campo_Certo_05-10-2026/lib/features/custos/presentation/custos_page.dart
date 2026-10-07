import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class CustosPage extends StatelessWidget {
  const CustosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custos'),
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
                  'Controle de Custos',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.verdeEscuro,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Registre e acompanhe os gastos da sua propriedade.',
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
                    CardCusto(
                      icone: Icons.add_card,
                      titulo: 'Registrar custo',
                      descricao: 'Adicione um novo gasto da propriedade.',
                    ),
                    CardCusto(
                      icone: Icons.receipt_long,
                      titulo: 'Histórico de custos',
                      descricao: 'Consulte os gastos registrados anteriormente.',
                    ),
                    CardCusto(
                      icone: Icons.pie_chart_outline,
                      titulo: 'Resumo financeiro',
                      descricao: 'Visualize uma visão geral dos seus custos.',
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

class CardCusto extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;

  const CardCusto({
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
                color: AppTheme.verdeClaro,
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