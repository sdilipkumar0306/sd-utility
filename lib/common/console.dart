part of "../sd_utility.dart";

sdPrint([Object? object, String? name]) {
  String line = (object ?? '***********************************************************').toString();
  log(line, name: name ?? "LOCAL PRINT", time: DateTime.now());
}
