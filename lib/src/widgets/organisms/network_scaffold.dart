import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart'
    show
        AlignmentDirectional,
        EdgeInsets,
        EdgeInsetsGeometry,
        Padding,
        Scaffold,
        SizedBox,
        Widget;
import 'package:flutter_riverpod/flutter_riverpod.dart' show Consumer;

import '../../core/enums/enums.dart' show ConnectivityStatus;
import '../../pages/not_found/internet_not_found.dart' show InternetNotFound;
import '../../providers/provider_instance.dart' show connectivityProvider;

class NetworkScaffold extends Scaffold {
  final Widget mainBody;
  final Widget noInternetWidget;
  final EdgeInsetsGeometry bodyPadding;
  NetworkScaffold({
    super.key,
    super.appBar,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.floatingActionButtonAnimator,
    super.persistentFooterButtons,
    super.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    super.drawer,
    super.onDrawerChanged,
    super.endDrawer,
    super.onEndDrawerChanged,
    super.bottomNavigationBar,
    super.bottomSheet,
    super.backgroundColor,
    super.resizeToAvoidBottomInset,
    super.primary = true,
    super.drawerDragStartBehavior = DragStartBehavior.start,
    super.extendBody = false,
    super.extendBodyBehindAppBar = false,
    super.drawerScrimColor,
    super.drawerEdgeDragWidth,
    super.drawerEnableOpenDragGesture = true,
    super.endDrawerEnableOpenDragGesture = true,
    super.restorationId,
    this.mainBody = const SizedBox(),
    this.bodyPadding = EdgeInsets.zero,
    this.noInternetWidget = const InternetNotFound(),
  }) : super(
          body: Padding(
            padding: bodyPadding,
            child: Consumer(
              builder: (context, ref, child) {
                final status = ref.watch(connectivityProvider).status;
                switch (status) {
                  case ConnectivityStatus.initial:
                  case ConnectivityStatus.isConnected:
                    return mainBody;
                  case ConnectivityStatus.isDisconnected:
                    return noInternetWidget;
                  default:
                    return mainBody;
                }
              },
            ),
          ),
        );
}
