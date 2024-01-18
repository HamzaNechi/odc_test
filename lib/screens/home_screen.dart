import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:odc/main.dart';
import 'package:odc/models/place_model.dart';
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
  List<Place> placesSearched=[];
  late double initSheet;
  late String urlS;
  late String lon;
  late String lat;
  String search = "";


  @override
  void initState() {
    super.initState();
    sharedPref.setString('lon', '10.63699');
    sharedPref.setString('lat', '35.82539');
    lon = sharedPref.getString('lon')!;
    lat = sharedPref.getString('lat')!;
    initSheet = double.parse(sharedPref.getString('initSheet')!);
    urlS ='https://api.opentripmap.com/0.1/en/places/radius?apikey=5ae2e3f221c38a28845f05b6e1e72f6e6fae9bc6a9473af209e333f9&radius=${initSheet}&lon=${lon}&lat=${lat}&rate=3&format=json';
    
    _fetchData();
  }


  Future<void> liveSearch()async {
    try {
      final response = await http.get(Uri.parse("${urlS}&name=${search}"));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        for (var item in data) {
          var place = Place(item['xid'], item['name'], item['kinds'], item['dist'] );
          setState(() {
            placesSearched.add(place);
          });
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print(error);
    }

  }

  Future<void> _fetchData() async {
    try {
      final response = await http.get(Uri.parse(urlS));
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




  displaySheet(BuildContext context){
    return showModalBottomSheet(
      context: context, 
      builder: (context) => Container(
        height: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: greyForBackgroundColor
        ),

        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Slider(  
            min: 100,  
            max: 1500,  
            value: initSheet,  
            onChanged: (value) {  
              setState(() {  
                initSheet = value;
                sharedPref.setString('initSheet', value.toString());
                _fetchData();
              });  
            },  
          ),
          ),
      ),
      );
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 45,),
        InkWell(
          onTap: () {
            displaySheet(context);
          },
          child: const ToolbarHome(title: "Lucky Trip", showSettings: true,)),

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
                          ///dropdown
                          return Dialog(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 300,
                              decoration: const BoxDecoration(
                                color: greyForBackgroundColor,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),

                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        
                                      },

                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: greyColor
                                            )
                                          )
                                        ),

                                        child: Center(
                                          child: Text("Select a city", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: greyColor),),
                                        ),
                                      ),
                                    ),





                                    InkWell(
                                      onTap: () {
                                        sharedPref.setString("region", "tunis");
                                      },

                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: greyColor
                                            )
                                          )
                                        ),

                                        child: Center(
                                          child: Text("Tunis", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: greyColor),),
                                        ),
                                      ),
                                    ),





                                    InkWell(
                                      onTap: () {
                                        sharedPref.setString('lon', '10.832528');
                                        sharedPref.setString('lat', '36.552051');

                                        setState(() {
                                          _fetchData();
                    
                                        });
                                        Navigator.pop(context);
                                      },

                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: greyColor
                                            )
                                          )
                                        ),

                                        child: Center(
                                          child: Text("Sousse", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: greyColor),),
                                        ),
                                      ),
                                    ),



                                    InkWell(
                                      onTap: () {
                                        sharedPref.setString('lon', '10.63699');
                                        sharedPref.setString('lat', '35.82539');

                                        setState(() {
                                          _fetchData();
                    
                                        });
                                        Navigator.pop(context);
                                      },

                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: greyColor
                                            )
                                          )
                                        ),

                                        child: Center(
                                          child: Text("Ariana", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: greyColor),),
                                        ),
                                      ),
                                    ),




                                    InkWell(
                                      onTap: () {
                                        sharedPref.setString("region", "bizerte");
                                      },

                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: greyColor
                                            )
                                          )
                                        ),

                                        child: Center(
                                          child: Text("Bizerte", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: greyColor),),
                                        ),
                                      ),
                                    ),




                                    InkWell(
                                      onTap: () {
                                        sharedPref.setString("region", "sfax");
                                      },

                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: greyColor
                                            )
                                          )
                                        ),

                                        child: Center(
                                          child: Text("Sfax", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: greyColor),),
                                        ),
                                      ),
                                    ),




                                    InkWell(
                                      onTap: () {
                                        sharedPref.setString("region", "mannouba");
                                      },

                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: greyColor
                                            )
                                          )
                                        ),

                                        child: Center(
                                          child: Text("Manouba", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: greyColor),),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),  
                            );
                            
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

        const SizedBox(height: 16,),


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
                cursorColor: greyColor,
                onChanged: (value) {
                  setState(() {
                    if(value.isNotEmpty){
                      search = value;
                      liveSearch();
                    }else{
                      placesSearched = [];
                    }
                    
                  });
                },
                decoration: const InputDecoration(
                  
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                    gapPadding: 7
                  ),
                  fillColor: greyForBackgroundColor,
                  filled: true,
                
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Chercher votre place',
                  hintStyle: TextStyle(color:  greyColor, fontSize: 14, fontWeight: FontWeight.w300)
                ),
              ),
        ),

        const SizedBox(height: 16,),

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
            height: MediaQuery.of(context).size.height * 0.5,
            width:  MediaQuery.of(context).size.width,
            
            child: ListView.builder(
              itemCount: placesSearched.isNotEmpty ? placesSearched.length : places.length,
              itemBuilder: (context, index) {
                return PlaceCard(place: placesSearched.isNotEmpty ? placesSearched[index] :places[index],);
              },
            ),
          ),
        )

      ],
    );
  }
}