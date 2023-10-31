
import 'package:cleanarchtdd/core/Enum/enum_language.dart';

class TextUtil {
  
  static String get countrieText {
    return _getTranslatedText('Country', 'País', 'País', 'Pays');
  }
  static String get notFoundText {
    return _getTranslatedText('Not Found', 'Não Encontrado', 'No Encontrada', 'Pas Trouvé');
  }
  static String get capitalText {
    return _getTranslatedText('Capital', 'Capital', 'Capital', 'Capitale');
  }
  static String get iso2Text {
    return _getTranslatedText('Iso2', 'Iso2', 'Iso2', 'Iso2');
  }
  static String get iso3Text {
    return _getTranslatedText('Iso3', 'Iso3', 'Iso3', 'Iso3');
  }
   static String get countriesText {
    return _getTranslatedText('Countries', 'Países', 'Países', 'Des Pays');
  }
  static String get searchResoutsWillShowHereText {
    return _getTranslatedText('Search results will appear here!', 'Os resultados da pesquisa aparecerão aqui!', 'Los resultados de la búsqueda aparecerán aquí!', 'Les résultats de la recherche apparaîtront ici!');
  }
  static String get connectionErrorText {
    return _getTranslatedText('Connection Error', 'Erro de conexão', 'Error de conexión, inténtalo de nuevo', 'Erreur de connexion, réessayez');
  }
  static String get runtimeErrorText {
    return _getTranslatedText('Runtime Error', 'Erro de tempo de execução', 'Error de tiempo de ejecución', 'Erreur d\'exécution');
  }
  static String get errorServerNotFoundText {
    return _getTranslatedText('Server not found', 'Erro Servidor Não Encontrado', 'Servidor no encontrado', 'Serveur introuvable');
  }
  static get httpErrorText {
    return _getTranslatedText('Http Error', 'Erro Http', 'Error del Http', 'Erreur du Http');
  }
  static String get searchText {
    return _getTranslatedText('Search', 'Procurar', 'Buscar', 'Recherche');
  }
  static String get authUserErrorText {
    return _getTranslatedText('User Authentication Error', 'Erro de Autenticação do Usuário', 'Error de Autenticación de Usuario', 'Erreur d\'Authentification Utilisateur');
  }
  static String get noInternetConnectionText {
    return _getTranslatedText('No Internet Connection', 'Sem Conexão de Internet', 'Sin Conexión a Internet', 'Pas de Connexion Internet');
  }

  static String get checkingInternetConnectionText {
    return _getTranslatedText('Checking Internet Connection!', 'Checando Conexão de Internet!', 'Comprobando la Conexión a Internet!', 'Vérification de la Connexion Internet!');
  }

  static String get noCountrieFoundText {
    return _getTranslatedText('No Country Found', 'Nenhum País Encontrado', 'No se Encontró Ningún País', 'Aucun Pays Trouvé');
  }

  static EnumLanguage get _language { return EnumLanguage.english; }

  static String _getTranslatedText(String english, [String? portuguese, String? spanish, String? french]) {
    assert(english != '' && english.isNotEmpty);
    switch (_language) {
      case EnumLanguage.portuguese:
        return portuguese ?? english;
      case EnumLanguage.spanish:
        return spanish ?? english;
      case EnumLanguage.french:
        return french ?? english;
      default:
        return english;
    }
  }
}