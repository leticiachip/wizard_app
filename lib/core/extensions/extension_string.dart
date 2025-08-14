extension ExtensionString on String {
  String hexToAscii() {
    return List.generate(
      length ~/ 2,
      (i) => String.fromCharCode(
        int.parse(substring(i * 2, (i * 2) + 2), radix: 16),
      ),
    ).join();
  }
}
