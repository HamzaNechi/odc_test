import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:odc/main.dart';
import 'package:odc/models/place_model.dart';
import 'package:odc/screens/widgets/place_card.dart';
import 'package:odc/screens/widgets/toolbar_home.dart';
import 'package:http/http.dart' as http;


class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {



  List<Place> places_favorit=[];

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
          List<String>? ls = sharedPref.getStringList('favorit');
          
          if(ls!.contains(item['xid'])){
            setState(() {
              places_favorit.add(place);
            });
          }
          
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
        const SizedBox(height: 80,),
        const ToolbarHome(title: "Favorites", showSettings: false,),

        const SizedBox(height: 40,),

         Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 8,),
            Text("Places of interest (${places_favorit.length})", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
          ],
        ),

       const SizedBox(height: 15,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.66,
            width:  MediaQuery.of(context).size.width,
            
            child: ListView.builder(
              itemCount: places_favorit.length,
              itemBuilder: (context, index) {
                return PlaceCard(place: places_favorit[index],);
              },
            ),
          ),
        )

      ],
    );
  }
}