import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class ProducaoPage extends StatelessWidget {
  const ProducaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produção'),
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
                  'Controle de Produção',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.verdeEscuro,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Registre e acompanhe as informações da produção da propriedade.',
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
                    CardProducao(
                      icone: Icons.add_circle_outline,
                      titulo: 'Registrar produção',
                      descricao: 'Adicione um novo registro de produção.',
                    ),
                    CardProducao(
                      icone: Icons.history,
                      titulo: 'Histórico',
                      descricao: 'Consulte os registros anteriores.',
                    ),
                    CardProducao(
                      icone: Icons.insights,
                      titulo: 'Desempenho',
                      descricao: 'Acompanhe a evolução da produção.',
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

class CardProducao extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;

  const CardProducao({
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
                color: AppTheme.verdeEscuro,
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