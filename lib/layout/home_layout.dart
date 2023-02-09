import 'package:flutter/material.dart';
import 'package:headlines_now/models/SourcesResponse.dart';
import 'package:headlines_now/shared/network/remote/api_amnger.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'homeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("News")
        ,),
      body: FutureBuilder<SourcesResponse>(builder: (context, snapshot){
        if(snapshot.connectionState==ConnectionState.waiting)
          {
            return Center(child: CircularProgressIndicator());

          }
        if(snapshot.hasError){
          return Column(
            children: [
              const Text("Error"),
              TextButton(onPressed: () {

              }, child: const Text("Try Again"))
            ],

          );

        }
        if(snapshot.data?.status != 'ok')
          {
            return Column(
              children: [
                 Text (snapshot.data!.message?? ""),
                TextButton(onPressed: () {

                }, child: const Text("Try Again"))
              ],

            );

          }
      } ,future: ApiManger.getSources(),),
    );
  }
}
