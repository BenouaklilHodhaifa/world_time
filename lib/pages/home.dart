import 'package:flutter/material.dart';
import 'package:world_time/customClasses/LoadingScreenArguments.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  LoadingScreenArguments? data = null;

  @override
  Widget build(BuildContext context) {
    // the data from the loading screen
    if (data == null) {
      data = ModalRoute.of(context)!.settings.arguments as LoadingScreenArguments;
    } else {
      data = data;
    }

    String bgImage = data!.isDaytime ? 'day.png' : 'night.png' ;

    Color? bgColor = data!.isDaytime ? Colors.blue[400] : Colors.indigo[900];


    return  Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child:  Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 220, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data!.location = result.location ;
                        data!.flag = result.flag;
                        data!.time = result.time;
                        data!.isDaytime = result.isDaytime;
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[200],
                    ),
                    label: Text(
                        'edit location',
                      style: TextStyle(
                        color: Colors.grey[200]
                      ),
                    ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/${data!.flag}'),
                      radius: 16.0,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      data!.location,
                      style: const TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data!.time,
                  style: const TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
