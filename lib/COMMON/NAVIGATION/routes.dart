// ignore_for_file: constant_identifier_names
import 'package:fluro/fluro.dart';
import 'package:flutter_template_mobile/DOMAIN/REMOTE/REPOSITORY/example_repository.dart';
import 'package:flutter_template_mobile/di/injector.dart';
import 'package:flutter_template_mobile/ui/SCREEN/HOME_PAGE/home_page_view.dart';
import 'package:flutter_template_mobile/ui/SCREEN/HOME_PAGE/home_page_view_model.dart';
import 'package:provider/provider.dart';

class CustomRouter {
  static FluroRouter router = FluroRouter();

  //Qui definisco gli identificativi per le varie navigazioni
  static const String HOME_PATH = '/home_page';

  //Qui definisco gli handler per ciascuna rotta (con eventuali argomenti)
  static final Handler _homePageHandler = Handler(
    handlerFunc: (context, params) {
      //argomenti da passare al viewModel della view di navigazione
      //final arguments = context?.settings?.arguments as HomeArguments;
      return ChangeNotifierProvider<HomePageViewModel>(
        create: (_) => HomePageViewModel(getIt<ExampleRepository>()),
        child: const HomePageView(),
      );
    },
  );

  // Questa funzione inizializza tutte le rotte nel main
  static void inizializeRoutes() {
    router.define(
      HOME_PATH,
      handler: _homePageHandler,
      transitionType: TransitionType.fadeIn,
    );
  }
}
