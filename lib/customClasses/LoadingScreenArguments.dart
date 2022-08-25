// this class is a container for the data that will be passed from the loading screen to the home screen
class LoadingScreenArguments {
  late  String location;
  late  String time;
  late  String flag;
  late bool isDaytime;

  LoadingScreenArguments({required this.location, required this.time, required this.flag, required this.isDaytime});

}