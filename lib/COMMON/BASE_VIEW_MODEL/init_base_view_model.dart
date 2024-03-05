import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/COMMON/BASE_VIEW_MODEL/base_view_model.dart';
import 'package:provider/provider.dart';

/// Il mixin `InitBaseViewModel` fornisce un metodo di inizializzazione per
/// assegnare il [BuildContext] al [BaseViewModel] associato.
///
/// È progettato per essere utilizzato con classi che estendono [BaseViewModel].
mixin InitBaseViewModel<T extends BaseViewModel> {
  /// Inizializza il [BaseViewModel] associato con il [BuildContext] fornito.
  ///
  /// È importante chiamare questo metodo nel metodo `didChangeDependencies` o in un
  /// punto appropriato del ciclo di vita del widget, poiché richiede un [BuildContext].
  ///
  /// Restituisce l'istanza del [BaseViewModel] inizializzata.
  T initBaseViewModel(BuildContext context) {
    // Ottieni l'istanza del [BaseViewModel] utilizzando il Provider.
    T viewModel = Provider.of<T>(context, listen: false);
    // Imposta il [BuildContext] del [BaseViewModel] con il contesto fornito.
    // Ricorda che questo contesto è quello passato in didChangeDependencies,
    // quindi è il contesto radice della pagina.
    viewModel.context = context;

    // Restituisci l'istanza del [BaseViewModel] inizializzata.
    return viewModel;
  }
}
