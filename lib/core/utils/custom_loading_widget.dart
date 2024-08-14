import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoading{
  const CustomLoading._();

  static Widget show(BuildContext context)=>Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const CupertinoActivityIndicator(),
      const SizedBox(height: 4,),
      Text("Loading...", style: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: Theme.of(context).brightness==Brightness.light?Colors.grey[600]:Colors.grey[800]
      ),)
    ],
  );
}