import 'package:flutter/material.dart';
import 'package:space/pages/base_view.dart';
import 'package:space/pages/root/root_vm.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RootViewModel>(
        builder: (c, viewModel, w) => WillPopScope(
              onWillPop: () async {
                return !await context
                    .read<RootViewModel>()
                    .navigatorState
                    .currentState!
                    .maybePop();
              },
              child: Scaffold(
                drawer: viewModel.currentIndex == 0 ? const Drawer() : null,
                body: IndexedStack(
                    index: viewModel.currentIndex, children: viewModel.pages),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: viewModel.currentIndex,
                  onTap: (v) {
                    if (v == viewModel.currentIndex) {
                      viewModel.navigatorState.currentState!
                          .popUntil((route) => route.isFirst);
                    } else {
                      viewModel.setCurrentIndex(v);
                    }
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.newspaper), label: "News"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: "Account")
                  ],
                ),
              ),
            ));
  }
}
