import 'package:flutter/material.dart';
import 'package:headlines_now/screens/tab_item.dart';

import '../models/SourcesResponse.dart';

class MyTabController extends StatefulWidget {
  MyTabController(this.sources);
  List<Sources> sources;

  @override
  State<MyTabController> createState() => _MyTabControllerState();
}

class _MyTabControllerState extends State<MyTabController> {
  int selectedIndex= 0 ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: TabBar(
          onTap: (value) {
            selectedIndex = value;
            setState(() {

            });
          },
          isScrollable: true,
          labelColor: Colors.black,
          tabs: widget.sources.map((e) => TabItem(e, selectedIndex==widget.sources.indexOf(e)?true:false )).toList(),
        )
    );
  }
}
