class tokenAPI {
  static String tokenName;
  static String url;
  //http://192.168.0.105:443
  tokenAPI.addtoken(String token) {
    tokenName = token;
  }
  tokenAPI.addurl(String url2) {
    url = "http://" + url2;
  }
  tokenAPI.geturl() {
    print(url);
  }
}
