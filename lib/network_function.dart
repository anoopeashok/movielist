import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkCall{


  Future<CustomResposne> getRequest() async{
    var response  = await http.get('https://api.themoviedb.org/3/movie/upcoming?api_key=9c0523bff54071c4fb4b716a950231b9');
    if (response.statusCode == 200){
      return CustomResposne(true,jsonDecode(response.body));
    } else{
      return CustomResposne(false,'Something wrong');

    }
  }

}

class CustomResposne{

  var status;
  var body;

  CustomResposne(this.status,this.body);
}