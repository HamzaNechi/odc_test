import 'package:flutter/material.dart';
import 'package:odc/utils/colors.dart';

class CustomDropdownMenu extends StatelessWidget {
  const CustomDropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}