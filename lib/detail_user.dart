import 'package:flutter/material.dart';

class DetailUser extends StatelessWidget {
  const DetailUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail User"),
      ),
      body: _loadDetailUser(),
    );
  }

  Widget _loadDetailUser() {}
}
