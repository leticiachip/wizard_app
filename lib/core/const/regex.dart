class RegexAuthConstants {
  static const String email = r"[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+";
  static const String password =
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$";
}
