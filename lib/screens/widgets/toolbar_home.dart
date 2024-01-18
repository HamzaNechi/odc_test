import 'package:flutter/material.dart';
import 'package:odc/utils/colors.dart';

class ToolbarHome extends StatelessWidget {
  final String title;
  final bool showSettings;
  const ToolbarHome({super.key, required this.title, required this.showSettings});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Visibility(
          visible: showSettings,
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.settings, size: 22, color: darkColor,),
              ],
            ),
          ),
        ),


        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text( title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: darkColor),),
            ],
          ),
        )
      ],
    );
  }
}