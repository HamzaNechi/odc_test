import 'package:flutter/material.dart';
import 'package:odc/screens/widgets/place_card.dart';
import 'package:odc/screens/widgets/toolbar_home.dart';
import 'package:odc/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 45,),
        const ToolbarHome(),

        const SizedBox(height: 40,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Container(
                  height: 43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: primaryColor
                  ),

                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Select a city", style: TextStyle(color: whiteColor, fontWeight: FontWeight.w400),),
                    ),
                  ),
                ),
              ),


              InkWell(
                onTap: () {
                  print("get lat and ");
                },
                child: const Row(
                  children: [
                    Icon(Icons.location_on_rounded, color: darkColor, size: 20,),
                    Text("Use my current location", style: TextStyle(color: darkColor, fontWeight: FontWeight.w400),)
                  ],
                ),
              )
            ],
          ),
        ),

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
            height: MediaQuery.of(context).size.height * 0.57,
            width:  MediaQuery.of(context).size.width,
            
            child: ListView(
              children: const [
                PlaceCard(),
                PlaceCard(),
                PlaceCard(),
                PlaceCard(),
                PlaceCard(),
                PlaceCard(),
                PlaceCard(),
                PlaceCard(),
                PlaceCard(),
              ],
            ),
          ),
        )

      ],
    );
  }
}