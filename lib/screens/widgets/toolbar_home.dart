import 'package:flutter/material.dart';
import 'package:odc/utils/colors.dart';

class ToolbarHome extends StatelessWidget {
  const ToolbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.settings, size: 22, color: darkColor,),
            ],
          ),
        ),


        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Lucky Trip", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: darkColor),),
            ],
          ),
        )
      ],
    );
  }
}