import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:world_time/customClasses/LoadingScreenArguments.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async { // (async) to use (await)
    WorldTime inst = WorldTime(location: 'Algiers', flag: 'algeria.png', url: '/Africa/Algiers');
    await inst.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: LoadingScreenArguments(
        location: inst.location, time: inst.time, flag: inst.flag, isDaytime: inst.isDaytime)
    );
  }

  @override
  void initState(){
    super.initState();
    setupWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:  SpinKitFadingCircle(
          color: Colors.blue,
          size: 80.0,
        ),
      )
    );
  }
}
