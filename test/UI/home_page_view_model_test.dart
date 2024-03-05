import 'package:flutter_template_mobile/DOMAIN/REMOTE/REPOSITORY/example_repository.dart';
import 'package:flutter_template_mobile/UI/SCREEN/HOME_PAGE/home_page_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Creazione di mock per ExampleRepository
class MockExampleRepository extends Mock implements ExampleRepository {}

void main() {
  group('HomePageViewModel', () {
    late HomePageViewModel homePageViewModel;
    late MockExampleRepository mockExampleRepository;

    setUp(() {
      mockExampleRepository = MockExampleRepository();
      homePageViewModel = HomePageViewModel(mockExampleRepository);
    });

    test('increment1 should increase num1 and notify listeners', () {
      homePageViewModel.increment1();
      expect(homePageViewModel.num1, equals(1));
    });

    test('increment2 should increase num2 and notify listeners', () {
      homePageViewModel.increment2();
      expect(homePageViewModel.num2, equals(1));
    });

    test('initViewModel should call exampleSOAP', () async {
      // Simula il comportamento di exampleSOAP quando viene chiamato
      when(() => mockExampleRepository.exampleSOAP()).thenAnswer((_) async {});

      await homePageViewModel.initViewModel();

      // Verifica che exampleSOAP sia stato chiamato
      verify(() => mockExampleRepository.exampleSOAP()).called(1);
    });
  });
}
