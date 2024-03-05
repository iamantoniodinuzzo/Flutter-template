// ignore: unused_import
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/COMMON/BASE_VIEW_MODEL/init_base_view_model.dart';
import 'package:flutter_template_mobile/COMMON/UTIL/connectivity_util.dart';
import 'package:flutter_template_mobile/COMMON/UTIL/extensions/extensions.dart';
import 'package:flutter_template_mobile/ui/SCREEN/HOME_PAGE/home_page_view_model.dart';
import 'package:flutter_template_mobile/ui/WIDGETS/generic_widgets/BUTTONS/default_button.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView>
    with InitBaseViewModel<HomePageViewModel> {
  late HomePageViewModel viewModel;
  late ConnectivityUtil _connectivityUtil;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel = initBaseViewModel(context);
  }

  @override
  void initState() {
    super.initState();
    _connectivityUtil = ConnectivityUtil(
      onConnectionStatusChanged: _updateConnectionStatus,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.initViewModel();
    });
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      // Internet is not available
      _showSnackbar('Internet non disponibile');
    } else {
      // Internet is available
      _hideSnackbar();
    }
  }

  void _showSnackbar(String message) {
    context.scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(days: 1),
      ),
    );
  }

  void _hideSnackbar() {
    context.scaffoldMessenger.hideCurrentSnackBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Consumer<HomePageViewModel>(
                builder: (context, value, child) => Text(value.num1.toString()),
              ),
              Consumer<HomePageViewModel>(
                builder: (context, value, child) => Text(value.num2.toString()),
              ),
            ],
          ),
          const Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 1,
                child: DefaultButton.primary(
                  buttonText: 'Primo',
                  width: context.mediaQuery.size.width,
                  onPress: () {
                    viewModel.increment1();
                  },
                ),
              ),
              const Gap(8),
              Flexible(
                flex: 1,
                child: DefaultButton.secondary(
                  width: context.mediaQuery.size.width,
                  buttonText: 'Secondo',
                  onPress: () {
                    viewModel.increment2();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _connectivityUtil.dispose();
    super.dispose();
  }
}
