import 'package:cleanarchtdd/core/widgets/body_msg_widget.dart';
import 'package:cleanarchtdd/core/widgets/progress_indicator_widget.dart';
import 'package:cleanarchtdd/features/countries/data/repositories/country_repository_mock.dart';
import 'package:cleanarchtdd/features/countries/presentation/bloc/country_bloc.dart';
import 'package:cleanarchtdd/features/countries/presentation/screens/country_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  late CountryBloc countryBloc;
  setUpAll(() {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    countryBloc = CountryBloc(CountryRepositoryMock());
  },);

  tearDownAll(() {
    countryBloc.dispose();
  });

  testWidgets("Offline: Check all country_screen states", (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(home: CountryScreen(countryBloc: countryBloc)),);
    final countryButton = find.byType(ElevatedButton);
    final progressIndicator = find.byType(ProgressIndicatorWidget);
    final countryList = find.byType(ListView);
    final bodyMsgWidget = find.byType(BodyMsgWidget);
    final text = find.byType(Text);
    expect(countryButton, findsOneWidget);
    expect(text, findsNWidgets(2));
    expect(bodyMsgWidget, findsOneWidget);
    expect(countryList, findsNothing);
    expect(progressIndicator, findsNothing);

    await widgetTester.tap(countryButton);
    await widgetTester.pumpAndSettle();
    expect(countryButton, findsOneWidget);
    expect(bodyMsgWidget, findsNothing);
    expect(countryList, findsOneWidget);
    expect(progressIndicator, findsNothing);

  }, tags: "offline");

}