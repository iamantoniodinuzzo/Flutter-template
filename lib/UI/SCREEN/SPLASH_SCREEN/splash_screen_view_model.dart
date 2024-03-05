
import 'package:flutter_template_mobile/COMMON/BASE_VIEW_MODEL/base_view_model.dart';
import 'package:flutter_template_mobile/COMMON/NAVIGATION/routes.dart';

class SplashScreenViewModel extends BaseViewModel {
  //----------------------------------------------------------------------------
  // CONSTRUCTOR (costruttore della classe in cui aggiungere gli arguments)
  //----------------------------------------------------------------------------
  SplashScreenViewModel();

  //----------------------------------------------------------------------------
  // CLASS LIFE CYCLE (qui, se serve, va inizializzato il view model)
  //----------------------------------------------------------------------------
  Future<void> initViewModel() async {

    await Future.delayed(const Duration(seconds: 10));

    _navigateToMain();
  }

  //----------------------------------------------------------------------------
  // CLASS PARAMETERS (varibali _private della classe)
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // CLASS GETTER AND SETTER PARAMETERS
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // CLASS METHODS
  //----------------------------------------------------------------------------


  /// navigazione verso la home
  void _navigateToMain() {
    CustomRouter.router.navigateTo(
      context,
      CustomRouter.HOME_PATH,
      clearStack: true,
    );
  }

//----------------------------------------------------------------------------
// CLASS LISTNERS
//----------------------------------------------------------------------------
}
