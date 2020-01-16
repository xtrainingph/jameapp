import 'package:http/http.dart';

class Network {

  final String url;

  Network(this.url);

  Future getData() async {
    print("calling uri: $url");

    Response response = await get(url);
    // 5
    if (response.statusCode == 200) {
      // 6
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

}