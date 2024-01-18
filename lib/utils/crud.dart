import 'package:http/http.dart' as http;


import 'dart:convert';

class Crud {

  static String BASE_URL ="https://api.opentripmap.com/0.1/en/places/radius?apikey=5ae2e3f221c38a28845f05b6e1e72f6e6fae9bc6a9473af209e333f9&radius=5000&lon=10.63699&lat=35.82539&rate=3&format=json";

  //post request
  postRequest(String url, Map data) async{
    try{
      var response =await http.post(Uri.parse(url),body: data);
      if(response.statusCode == 200 || response.statusCode == 201){
        var responsebody = jsonDecode(response.body);
        return responsebody;
      }else{
        print("Error postRequest ${response.body}");
      }
    }catch(e){
      print("Error catch $e");
    }
  }





  //get request
  getRequest(String url) async {
    try{
      var response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        var responseBody = jsonDecode(response.body);
        return responseBody;
      }else{
        print("getRequest Error ${response.statusCode}");
      }
    }catch(e){
      print("Error catch $e");
    }
  }


  //delete request
  deletRequest(String url) async {
    try{
      var response = await http.delete(Uri.parse(url));
      if(response.statusCode == 200){
        var responseBody = jsonDecode(response.body);
        return responseBody;
      }else{
        print("Error deletRequest ${response.statusCode}");
      }
    }catch(err){
      print("Error catch $err");
    }
  }



  //update request

}