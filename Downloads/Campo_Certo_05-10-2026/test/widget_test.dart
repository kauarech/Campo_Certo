import 'package:flutter_test/flutter_test.dart';
import 'package:campo_certo/app/campo_certo_app.dart';

void main() {
  testWidgets('CampoCerto abre corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const CampoCertoApp());

    expect(find.byType(CampoCertoApp), findsOneWidget);
  });
}