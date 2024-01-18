import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
                  onTap: () {
                    print("Voir détail");
                  },
                  child: const Column(
                    children: [
                      ListTile(
                        title: Text("Medina"),
                        subtitle: Text("historic, interesting, places"),
                        trailing: Icon(Icons.star_border),
                      ),
                
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("71.95 m"),
                          ],
                        ),
                      )
                    ],
                  ),
                );
  }
}