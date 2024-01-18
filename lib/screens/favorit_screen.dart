import 'package:flutter/material.dart';
import 'package:odc/screens/widgets/place_card.dart';
import 'package:odc/screens/widgets/toolbar_home.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80,),
        const ToolbarHome(title: "Favorites", showSettings: false,),

        const SizedBox(height: 40,),

        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 8,),
            Text("Places of interest (28)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
          ],
        ),

       const SizedBox(height: 15,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.66,
            width:  MediaQuery.of(context).size.width,
            
            child: ListView(
              children: const [
                
              ],
            ),
          ),
        )

      ],
    );
  }
}