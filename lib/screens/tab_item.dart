import 'package:flutter/material.dart';
import 'package:headlines_now/models/SourcesResponse.dart';
import 'package:headlines_now/shared/styles/mytheme.dart';

class TabItem extends StatelessWidget {
  Sources sources;
  bool isSelected;
  TabItem(this.sources,this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
      decoration:BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(25),
        color: isSelected?Colors.blueAccent:Colors.transparent,
      ) ,
      child: Text(sources.name??"",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: isSelected?Colors.white:Colors.blueAccent)),
    );
  }
}
