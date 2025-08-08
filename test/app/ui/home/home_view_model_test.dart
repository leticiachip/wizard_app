import 'package:flutter_test/flutter_test.dart';
import 'package:wizard_app/app/ui/home/view_model/meu_widget_test.dart';

void main() {
  testWidgets('meu widget tem um titulo e uma mensagem', (tester) async {
    await tester.pumpWidget(const MyWidget(title: "T", message: "M"));
  });
}
