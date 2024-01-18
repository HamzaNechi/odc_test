import 'package:flutter/material.dart';
import 'package:odc/models/place_model.dart';
import 'package:odc/screens/detail_screen.dart';

class PlaceCard extends StatelessWidget {
  final Place place;
  const PlaceCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceDetail(idPlace: place.id,),));
                  },
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(place.nom.toString()),
                        subtitle: Text(place.categories.toString()),
                        trailing: const Icon(Icons.star_border),
                      ),
                
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("${place.dist.toStringAsFixed(2)} m"),
                          ],
                        ),
                      )
                    ],
                  ),
                );
  }
}