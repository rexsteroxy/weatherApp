import 'package:http/http.dart' as rex;
import 'dart:convert';


class NetworkCall {

  NetworkCall(this.url);
  final url;

  Future getData() async {
    rex.Response response = await rex.get(url);
    if(response.statusCode != 200){
      print(response.statusCode);
    }
    else{
      var data = response.body;
      return jsonDecode(data);
    }

  }
}