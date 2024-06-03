
 // ignore_for_file: non_constant_identifier_names
 
import 'package:doodstream_client/doodstream_client.dart';
import 'package:general_lib/extension/dynamic.dart';

void main(List<String> args) async {
  String api_key = "";
  DoodstreamClient doodstreamClient = DoodstreamClient(api_key: api_key);
  Map res = await doodstreamClient.getMe();
  res.printPretty();
}
