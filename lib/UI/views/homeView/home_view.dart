// for the business logic
import 'package:flutter/material.dart';
import 'package:handle_connectivity/UI/views/homeView/home_viewmodel.dart';

import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeViewModel riewModel = HomeViewModel();
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (v) => riewModel.getCharacters(),
        builder: (context, v, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: riewModel.status ? Colors.green : Colors.red,
              centerTitle: true,
              title: const Text(
                'Characters List',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              actions: [
                Text(
                  riewModel.status ? "Online" : "Offline",
                  style: const TextStyle(color: Colors.black),
                )
              ],
            ),
            body: riewModel.status == false
                ? const Center(
                    child: Text(
                      'No Internet Connection',
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                : Column(),
          );
        });
  }
}
