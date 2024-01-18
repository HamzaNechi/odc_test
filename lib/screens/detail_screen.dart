import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:odc/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:odc/utils/web_view.dart';


class PlaceDetail extends StatefulWidget {
  final String idPlace;
  const PlaceDetail({super.key,required this.idPlace});

  @override
  State<PlaceDetail> createState() => _PlaceDetailState();
}

class _PlaceDetailState extends State<PlaceDetail> {

  late dynamic data;
  bool getDet = false;

  @override
  void initState() {
    super.initState();
    getDetail();
  }

  Future<void> getDetail() async {
    try {
      final response = await http.get(Uri.parse('https://api.opentripmap.com/0.1/en/places/xid/${widget.idPlace}?apikey=5ae2e3f221c38a28845f05b6e1e72f6e6fae9bc6a9473af209e333f9'));
      if (response.statusCode == 200) {
        setState(() {
          getDet = true;
          data = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print(error);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50,),
          
          
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back_ios_new, color: darkColor, size: 16,),
                      SizedBox(width: 5,),
                      Text("Lucky Trip", style: TextStyle(color: darkColor, fontSize: 16, fontWeight: FontWeight.w400),)
                    ],
                  ),
                ),
              
              
              
                Text(getDet ? data['name'].toString() : "" , style: const TextStyle(color: darkColor, fontWeight: FontWeight.w500, fontSize: 20),),
              
                const SizedBox(width: 75,)
              ],
            ),


            const SizedBox(height: 50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.25,


                  decoration: getDet ? BoxDecoration(
                    image: DecorationImage(image: NetworkImage(data['preview']['source'].toString()))
                  ) : const BoxDecoration(
                    color:primaryColor
                  ),



                ),
              ],
            ),


            const SizedBox(height: 50,),

            Text(getDet ? data['name'].toString() : "" , style: const TextStyle(color: darkColor, fontWeight: FontWeight.w500, fontSize: 20),),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(getDet ? data['kinds'].toString() : "" , style: const TextStyle(color: darkColor, fontWeight: FontWeight.w300, fontSize: 14),)),


            const SizedBox(height: 16,),


            Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,

                  child: Text(
                    getDet ? data['wikipedia_extracts']['text'] : ""
                  ),



            ),




            const SizedBox(height: 16,),



            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(url: data["wikipedia"], nomPlace: data["name"],)));
                  },

                  child: const Text("Visit wikipedia",style: TextStyle(color: darkColor, fontWeight: FontWeight.w400, fontSize: 18),),
                ),
              ],
            )




          ],
        ),
      ),
    );
  }
}