part of sd_utility;

sdPrint([Object? object, String? name]) {
  if (!kDebugMode || kReleaseMode) return;
  String line = (object ?? '***********************************************************').toString();
  dev.log(line, name: name ?? "SD_UTILITY", time: DateTime.now());
}
