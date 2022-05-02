import 'package:api_call/models/user.dart';
import 'package:api_call/service/remotes_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<User>? usres;
  bool isloding = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }

  getuser() async {
    usres = await remoteservices().getusers();

    if (usres != null) {
      setState(() {
        isloding = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('get api'),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isloding,
        child: ListView.builder(
            itemCount: usres?.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(),
                  title: Text(usres![index].eduDetailId.toString()),
                  subtitle: Text(
                    usres![index].eduDetailTitle.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
