String convertListToString(List<String> list) {
  String res = "";
  for (String element in list) {
    res += "$element, ";
  }
  return res.substring(0, res.length - 2);
}
