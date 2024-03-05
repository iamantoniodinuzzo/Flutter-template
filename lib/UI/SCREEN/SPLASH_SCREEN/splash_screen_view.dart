import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/COMMON/BASE_VIEW_MODEL/init_base_view_model.dart';
import 'package:flutter_template_mobile/COMMON/theme/custom_colors.dart';
import 'package:flutter_template_mobile/COMMON/GLOBALS/globals.dart';
import 'package:flutter_template_mobile/ui/SCREEN/SPLASH_SCREEN/splash_screen_view_model.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with InitBaseViewModel<SplashScreenViewModel> {
  late SplashScreenViewModel viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel = initBaseViewModel(context);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.initViewModel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.white,
      child: expandedLoader,
    );
  }
}
