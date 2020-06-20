import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
  String location;//location name
  String time;//time in location
  String flag;//url to flag img
  String url;//api endpoint url
  bool isDayTime; //tme of day image

  WorldTime({this.location,this.time,this.flag,this.url});

  Future<void> getTime() async{
    try{
    Response response=await get('http://worldtimeapi.org/api/timezone/$url');
    Map data =jsonDecode(response.body);
    String datetime=data['datetime'];
    DateTime now=DateTime.parse(datetime);
    isDayTime = now.hour >6 && now.hour <18?  true : false;
    time =DateFormat.jm().format(now);
    }
    catch(e){
      print(e);
      time='Time unavailable';
    }
  }

}
