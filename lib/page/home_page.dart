import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/weather_model.dart';

class HomePage extends StatefulWidget {
  const new({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    print("init state");
  }
 
  Future<Weather> fetchWeatherData() async{
    Dio dio = Dio();
    final response = await dio.get("https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m");
   
    return Weather.fromJson(response.data);
  }

  @override
  Widget build(BuildContext context) {
      return FutureBuilder(future: fetchWeatherData(), builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }else if(snapshot.hasError){
          return Center(child: Text("Error: ${snapshot.error}"),);
        }else if(snapshot.hasData){
          final weather = snapshot.data!;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("City: ${weather.city}"),
                Text("Temperature: ${weather.temperature}"),
              ],
            ),
          );
        }else{
          return const Center(child: Text("No data"),);
        }
      },);
  }
}