import 'package:flutter/material.dart';
import 'package:noteapp/viewModel/HomeViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: HomeViewModel.getInstance(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Center(),
      ),
    );
  }

}
