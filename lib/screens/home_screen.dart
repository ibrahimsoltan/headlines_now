import 'package:flutter/material.dart';
import 'package:headlines_now/screens/tab_controller.dart';

import '../models/SourcesResponse.dart';
import '../shared/network/remote/api_amnger.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasError) {
        return Column(
          children: [
            const Text("Error"),
            TextButton(onPressed: () {}, child: const Text("Try Again"))
          ],
        );
      }
      if (snapshot.data?.status != 'ok') {
        return Column(
           children: [
            Text(snapshot.data!.message ?? ""),
            TextButton(onPressed: () {}, child: const Text("Try Again"))
          ],
        );
      }
      var sourcesList = snapshot.data?.sources ;
      return MyTabController(sourcesList!);
    },
      future: ApiManger.getSources(),
    );
  }
}
