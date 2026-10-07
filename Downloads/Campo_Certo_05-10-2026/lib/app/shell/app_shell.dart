import 'package:flutter/material.dart';

import '../../features/custos/presentation/custos_page.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/producao/presentation/producao_page.dart';
import '../../features/relatorios/presentation/relatorios_page.dart';
import '../../features/resumo/data/fake_indicador_repository.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _indiceSelecionado = 0;

  static const List<Widget> _paginas = [
    HomePage(
      repository: FakeIndicadorRepository(),
    ),
    ProducaoPage(),
    CustosPage(),
    RelatoriosPage(),
  ];

  void _mudarPagina(int indice) {
    setState(() {
      _indiceSelecionado = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _indiceSelecionado == 0,
      onPopInvoked: (didPop) {
        if (!didPop && _indiceSelecionado != 0) {
          _mudarPagina(0);
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: _indiceSelecionado,
          children: _paginas,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _indiceSelecionado,
          onDestinationSelected: _mudarPagina,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Início',
            ),
            NavigationDestination(
              icon: Icon(Icons.agriculture_outlined),
              selectedIcon: Icon(Icons.agriculture),
              label: 'Produção',
            ),
            NavigationDestination(
              icon: Icon(Icons.attach_money),
              selectedIcon: Icon(Icons.monetization_on),
              label: 'Custos',
            ),
            NavigationDestination(
              icon: Icon(Icons.bar_chart_outlined),
              selectedIcon: Icon(Icons.bar_chart),
              label: 'Relatórios',
            ),
          ],
        ),
      ),
    );
  }
}
