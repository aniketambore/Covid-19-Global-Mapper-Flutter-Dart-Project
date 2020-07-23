import 'dart:convert';

import 'package:covid19_global_mapper/covid_map_app/model/covid.dart';
import 'package:http/http.dart';


class Network{
  Future<Covid> getCovidData() async{
    var apiUrl = "https://corona-api.com/countries" ;

    final response = await get(Uri.encodeFull(apiUrl)) ;

    if(response.statusCode == 200){
      //print("Covid Data : ${response.body}");
      return Covid.fromJson(json.decode(response.body));
    }else{
      throw Exception("Error while getting the Data.") ;
    }
  }
}