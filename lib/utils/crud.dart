import 'package:http/http.dart' as http;


import 'dart:convert';

class Crud {

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