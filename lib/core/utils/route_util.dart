
class RouteUtil {

  static Future<String> get urlBaseAPI async { return 'https://countriesnow.space/api/v0.1'; }

  static Future<String> get urlGetCountries async { final base = await urlBaseAPI; return '$base/countries/capital'; }
  static Future<String> get urlAuthUser async { final base = await urlBaseAPI; return '$base/login'; }
  
}