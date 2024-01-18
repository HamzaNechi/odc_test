import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:odc/models/place_model.dart';
import 'package:odc/screens/widgets/dropdown_menu.dart';
import 'package:odc/screens/widgets/place_card.dart';
import 'package:odc/screens/widgets/toolbar_home.dart';
import 'package:odc/utils/colors.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List<Place> places=[];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final response = await http.get(Uri.parse('https://api.opentripmap.com/0.1/en/places/radius?apikey=5ae2e3f221c38a28845f05b6e1e72f6e6fae9bc6a9473af209e333f9&radius=5000&lon=10.63699&lat=35.82539&rate=3&format=json'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        for (var item in data) {
          var place = Place(item['xid'], item['name'], item['kinds'], item['dist'] );
          setState(() {
            places.add(place);
          });
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print(error);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 45,),
        const ToolbarHome(title: "Lucky Trip", showSettings: true,),

        const SizedBox(height: 40,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      showGeneralDialog(
                        context: context,
                        pageBuilder: (context, anim1, anim2) =>
                            const SizedBox(height: 0.0, width: 0.0),
                        transitionBuilder: (context, animation, secAnimation, child) {
                          
                          return const Dialog(child: CustomDropdownMenu(),  );
                            
                        },
                        barrierDismissible: true,
                        barrierLabel: 'dialog',
                      );
                    },
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
                  
                ],
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

         Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 8,),
            Text("Places of interest (${places.length})", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
          ],
        ),

       const SizedBox(height: 4,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.57,
            width:  MediaQuery.of(context).size.width,
            
            child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return PlaceCard(place: places[index],);
              },
            ),
          ),
        )

      ],
    );
  }
}