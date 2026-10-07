import 'package:flutter/material.dart';

import '../../../app/routes/fade_route.dart';
import '../../../app/shell/app_shell.dart';
import '../../../core/theme/app_theme.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();

  int paginaAtual = 0;

  final List<Map<String, dynamic>> paginas = [
    {
      'icone': Icons.agriculture,
      'titulo': 'Organize sua produção',
      'descricao':
          'Acompanhe as principais informações da sua propriedade rural.',
    },
    {
      'icone': Icons.attach_money,
      'titulo': 'Controle seus custos',
      'descricao':
          'Registre gastos e tenha uma visão melhor dos custos da propriedade.',
    },
    {
      'icone': Icons.bar_chart,
      'titulo': 'Visualize seus resultados',
      'descricao':
          'Consulte relatórios e acompanhe os resultados de forma simples.',
    },
  ];

  void proximaPagina() {
    if (paginaAtual < paginas.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        fadeRoute(const AppShell()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.fundo,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: paginas.length,
                onPageChanged: (index) {
                  setState(() {
                    paginaAtual = index;
                  });
                },
                itemBuilder: (context, index) {
                  final pagina = paginas[index];

                  return Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 140,
                        ),
                        const SizedBox(height: 40),
                        Icon(
                          pagina['icone'],
                          size: 90,
                          color: AppTheme.verdeEscuro,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          pagina['titulo'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.verdeEscuro,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          pagina['descricao'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black54,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                paginas.length,
                (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: paginaAtual == index ? 24 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: paginaAtual == index
                          ? AppTheme.verdeEscuro
                          : Colors.black26,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: proximaPagina,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.verdeEscuro,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    paginaAtual == paginas.length - 1
                        ? 'Começar'
                        : 'Próximo',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}