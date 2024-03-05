import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/COMMON/GLOBALS/globals.dart';
import 'package:flutter_template_mobile/COMMON/NAVIGATION/routes.dart';
import 'package:flutter_template_mobile/COMMON/THEME/app_theme.dart';
import 'package:flutter_template_mobile/DATA/LOCAL/ENTITIES/TODO_ITEM_ENTITY/todo_item_entity.dart';
import 'package:flutter_template_mobile/di/injector.dart';
import 'package:flutter_template_mobile/ui/SCREEN/SPLASH_SCREEN/splash_screen_view.dart';
import 'package:flutter_template_mobile/ui/SCREEN/SPLASH_SCREEN/splash_screen_view_model.dart';
import 'package:flutter_template_mobile/ui/WIDGETS/generic_widgets/LOADER/expanded_loader.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  //mi assicuro che i componenti base del framework siano inizializzati
  WidgetsFlutterBinding.ensureInitialized();

  //inizializzo la libreria per le traduzioni a runtime
  await EasyLocalization.ensureInitialized();

  //creo tutte le rotte dell'app
  log('INIZIALIZZO LE ROTTE');
  CustomRouter.inizializeRoutes();

  //inizilaizzo i valori costanti in base al sistema operativo
  log('INIZIALIZZO I PARAMETRI DI BASE');
  await setAppParameters();

  //Inizializzo il container delle dipendenze
  log('INIZIALIZZO IL CONTAINER DELLE DIPENDENZE');
  serviceLocatorInitialization();

  //Inizializzo Hive e i suoi adapter
  log('INIZIALIZZO HIVE');
  await Hive.initFlutter();
  log('INIZIALIZZO GLI ADAPTER PER LE ENTITÁ DI HIVE');
  Hive.registerAdapter(TodoItemEntityAdapter());

  //avvio dell'app
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('it')],
      path: 'assets/translations',
      // fallbackLocale:
      //     Locale.fromSubtags(languageCode: Platform.localeName.substring(0, 2)),
      child: const MyApp(),
    ),
  );
}

///Consente di rimuovere l'effetto glow lato android all'interno dei widget scrollabili (es. listview, gridview etc.)
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}

// MyApp per correttezza va rinominata con il vero nome dell'applicazione
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //all'interno di material app possono essere definite proprietà come il tema, la lingua e le rotte
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      //imposto il tema al solo tema chiaro
      themeMode: ThemeMode.light,
      //Utilizzo un tema custom
      theme: AppTheme.lightTheme,
      //supporto al multilingua (su IOS le lingue vanno aggiunte anche nel file info.plist)
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // va inserito un ChangeNotifierProvider per inizializzare correttamente il viewModel
      home: ChangeNotifierProvider<SplashScreenViewModel>(
        create: (_) => SplashScreenViewModel(),
        child: const SplashScreenView(),
      ),
    );
  }
}

///Funzione per settare i valori costanti dell'app in base al sistema
Future<void> setAppParameters() async {
  loader = Platform.isIOS
      ? const CupertinoActivityIndicator()
      : const CircularProgressIndicator();
  expandedLoader = ExpandedLoader(loader: loader);
}
