import 'network.dart';

const eventsURL = "https://runningmatelife.com/flutter-api/events.json";

class EventApi {

  Future<dynamic> getEvents() async {
    Network network = Network('$eventsURL');
    var catData = network.getData();
    return catData;
  }

}
