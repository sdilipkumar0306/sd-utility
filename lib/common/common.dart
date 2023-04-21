part of sd_utility;

Future<dynamic> readJsonFile(String path) async {
  final String response = await rootBundle.loadString(path);
  return await json.decode(response);
}
