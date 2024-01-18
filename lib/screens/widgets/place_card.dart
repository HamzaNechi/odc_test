import 'package:flutter/material.dart';
import 'package:odc/main.dart';
import 'package:odc/models/place_model.dart';
import 'package:odc/screens/detail_screen.dart';

class PlaceCard extends StatefulWidget {
  final Place place;
  const PlaceCard({super.key, required this.place});

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {

     bool isFavorit = false;

    @override
  void initState() {
    super.initState();
    List<String>? ls = sharedPref.getStringList('favorit');
    isFavorit = ls!.contains(widget.place.id);

  }
  @override
  Widget build(BuildContext context) {

 
    return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceDetail(idPlace: widget.place.id,),));
                  },
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(widget.place.nom.toString()),
                        subtitle: Text(widget.place.categories.toString()),
                        trailing: InkWell(
                          onTap: () {
                            List<String>? ls = sharedPref.getStringList('favorit');
                            ls!.add(widget.place.id);
                            sharedPref.setStringList('favorit',ls);
                            setState(() {
                              isFavorit = true;
                            });
                            
                            
                          },
                          child: Icon( isFavorit ? Icons.star : Icons.star_border)),
                      ),
                
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("${widget.place.dist.toStringAsFixed(2)} m"),
                          ],
                        ),
                      )
                    ],
                  ),
                );
  }
}