import 'package:flutter_template_mobile/COMMON/BASE_VIEW_MODEL/base_view_model.dart';
import 'package:flutter_template_mobile/DOMAIN/REMOTE/REPOSITORY/example_repository.dart';

class HomePageViewModel extends BaseViewModel {
  //----------------------------------------------------------------------------
  // CONSTRUCTOR (costruttore della classe in cui aggiungere gli arguments)
  //----------------------------------------------------------------------------
  HomePageViewModel(this._exampleRepository);

  //----------------------------------------------------------------------------
  // CLASS LIFE CYCLE (qui, se serve, va inizializzato il view model)
  //----------------------------------------------------------------------------

  // inizializzo il view model
  Future<void> initViewModel() async {
    await _exampleRepository.exampleSOAP();
  }

  //----------------------------------------------------------------------------
  // CLASS PARAMETERS (varibali _private della classe)
  //----------------------------------------------------------------------------

  final ExampleRepository _exampleRepository;
  //late ResponseState<List<Domain>> _restaurants;
  int _num1 = 0;
  int _num2 = 0;
  //----------------------------------------------------------------------------

  // CLASS GETTER AND SETTER PARAMETERS
  //----------------------------------------------------------------------------
  int get num1 => _num1;
  int get num2 => _num2;
  //ResponseState<List<Restaurant>> get restaurants => _restaurants;

  //----------------------------------------------------------------------------
  // CLASS METHODS
  //----------------------------------------------------------------------------
  void increment1() {
    _num1++;
    notifyListeners();
  }

  void increment2() {
    _num2++;
    notifyListeners();
  }
//----------------------------------------------------------------------------
// CLASS LISTNERS
//----------------------------------------------------------------------------
}
