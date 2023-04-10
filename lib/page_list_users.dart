import 'package:flutter/material.dart';
import 'package:modul_05_http_request/api_data_source.dart';
import 'package:modul_05_http_request/list_user_model.dart';

class PageListUsers extends StatelessWidget {
  const PageListUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Users"),
      ),
      body: _buildListUserBody(),
    );
  }

  Widget _buildListUserBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadUsers(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            ListUserModel listUserModel = ListUserModel.fromJson(snapshot.data);
            return _buildSuccessSection(listUserModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(ListUserModel data) {
    return ListView.builder(
      itemCount: data.data!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemUser(data.data![index]);
      },
    );
  }

  Widget _buildItemUser(Data userData) {
    return InkWell(
      // onTap: () => ,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Image.network(userData.avatar!),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userData.firstName! + " " + userData.lastName!),
                Text(userData.email!)
              ],
            )
          ],
        ),
      ),
    );
  }
}
