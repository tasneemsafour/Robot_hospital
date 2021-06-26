class token{
  static String tokenName ;
  String url;
  token({this.url});

  token.addtoken(String token){
    tokenName = token;
  }
}