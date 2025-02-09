import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // homePage
  {
    'hkueauee': {
      'pt': 'Reciclapp',
      'en': '',
    },
    'wwstmf6z': {
      'pt': '',
      'en': '',
    },
    'do8snpb7': {
      'pt': 'Dicas para separação correta de resíduos',
      'en': '',
    },
    'm8dxfrfi': {
      'pt': 'Coleta Solicitada',
      'en': '',
    },
    '18iq9q7x': {
      'pt': 'Coleta em Andamento',
      'en': '',
    },
    'loncgewo': {
      'pt': 'Coletor',
      'en': '',
    },
    '5ioqc1u4': {
      'pt': 'Home',
      'en': '',
    },
  },
  // loginPage
  {
    '4lfxz7pf': {
      'pt': 'Login',
      'en': '',
    },
    '29dfod45': {
      'pt': 'Login',
      'en': '',
    },
    'kioncojk': {
      'pt': 'Faça o login para continuar',
      'en': '',
    },
    '12ts8vn1': {
      'pt': 'Email',
      'en': '',
    },
    'oo7cuoh4': {
      'pt': 'Digite Seu Email',
      'en': '',
    },
    '9uqi8z8u': {
      'pt': 'Senha',
      'en': '',
    },
    'j4vh6tui': {
      'pt': 'Digite Sua Senha',
      'en': '',
    },
    'cpxkeubf': {
      'pt': 'Esqueceu a senha?',
      'en': '',
    },
    '81obsvwh': {
      'pt': 'Insira seu email',
      'en': '',
    },
    'k4qkdzyy': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '0ahkacp1': {
      'pt': 'Insira sua senha',
      'en': '',
    },
    'xoq0hzka': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '5d3jze7e': {
      'pt': 'Entrar',
      'en': '',
    },
    'gi04t98x': {
      'pt': 'Cadastro',
      'en': '',
    },
    'nlkkovev': {
      'pt': 'Crie Sua Conta',
      'en': '',
    },
    'hyiezcrz': {
      'pt': 'Nome',
      'en': '',
    },
    'djqnhv0d': {
      'pt': 'Digite Seu Nome',
      'en': '',
    },
    'cw6ho4wc': {
      'pt': 'Email',
      'en': '',
    },
    '435s8v8t': {
      'pt': 'Digite Seu Email',
      'en': '',
    },
    't5ngsfry': {
      'pt': 'Senha',
      'en': '',
    },
    '5714fusa': {
      'pt': 'Digite Uma Senha',
      'en': '',
    },
    '56bzs1mv': {
      'pt': 'Confrmar Senha',
      'en': '',
    },
    'id7mv5k1': {
      'pt': 'Confirme Sua Senha',
      'en': '',
    },
    'lly8flbr': {
      'pt': 'Selecione\n',
      'en': '',
    },
    'x9puqn54': {
      'pt': 'Search...',
      'en': '',
    },
    '5sq9vx4b': {
      'pt': 'Usuário',
      'en': '',
    },
    'f00chg79': {
      'pt': 'Coletor',
      'en': '',
    },
    'o7ok9ovx': {
      'pt': 'Cadastrar',
      'en': '',
    },
    'vam6unrb': {
      'pt': 'Já tenho uma conta!',
      'en': '',
    },
    '6dz1w2x7': {
      'pt': 'Insira seu nome',
      'en': '',
    },
    'xx6ilf47': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'eogpaom4': {
      'pt': 'Insira um email',
      'en': '',
    },
    'mdyhvf7z': {
      'pt': 'Email inválido',
      'en': '',
    },
    '7jje80nu': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'kfjityyo': {
      'pt': 'Insira uma senha',
      'en': '',
    },
    'f7mq1qtf': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ppof36ca': {
      'pt': 'Confirme sua senha',
      'en': '',
    },
    'wtqhvjhx': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ijvfh2tx': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // profilePage
  {
    'rfs3qx1m': {
      'pt': 'Nome',
      'en': '',
    },
    'sra7zsar': {
      'pt': 'Nome',
      'en': 'Nome',
    },
    'koes4k36': {
      'pt': 'Cep',
      'en': '',
    },
    'cp8psruf': {
      'pt': 'Cep',
      'en': '',
    },
    'x7s2m6h5': {
      'pt': 'Estado',
      'en': '',
    },
    'h6mfw927': {
      'pt': 'Estado',
      'en': '',
    },
    'hptusexw': {
      'pt': 'Cidade',
      'en': '',
    },
    'subot247': {
      'pt': 'Cidade',
      'en': '',
    },
    'ityobyvp': {
      'pt': 'Bairro',
      'en': '',
    },
    'lmksw9zt': {
      'pt': 'Bairro',
      'en': '',
    },
    'x3ealsiz': {
      'pt': 'Rua',
      'en': '',
    },
    '117tzfx9': {
      'pt': 'Rua',
      'en': '',
    },
    'cqsodnzy': {
      'pt': 'Número ',
      'en': '',
    },
    '65j7g7os': {
      'pt': 'Numero',
      'en': '',
    },
    'w7sbasx7': {
      'pt': 'Complemento',
      'en': '',
    },
    '9vzhlut6': {
      'pt': 'Complemento',
      'en': '',
    },
    'e5tibw2i': {
      'pt': 'Sair',
      'en': '',
    },
    'dw1dom33': {
      'pt': 'Salvar',
      'en': '',
    },
    'd0hfpr5r': {
      'pt': 'Nome é obrigatório',
      'en': '',
    },
    'klj689dw': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'gb95rx1x': {
      'pt': 'Insira um Cep',
      'en': '',
    },
    'ad5cvtu8': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'catgp6cn': {
      'pt': 'Insira um Estado',
      'en': '',
    },
    '92mf78hg': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'pg39hnsc': {
      'pt': 'Insira uma Cidade',
      'en': '',
    },
    '3q2ny3d9': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'g7meok6b': {
      'pt': 'Insira um Bairro',
      'en': '',
    },
    'p8sdg9h1': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '4muslfaj': {
      'pt': 'Insira uma Rua',
      'en': '',
    },
    'i5q62rgd': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '33zdxi3b': {
      'pt': 'Insira um Número',
      'en': '',
    },
    'ogbnw7wi': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'jtf8abgv': {
      'pt': 'complemento is required',
      'en': '',
    },
    '73kazaeg': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '1u4ia7hs': {
      'pt': 'TextField is required',
      'en': '',
    },
    'vtd1rrru': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'cbbwkdl6': {
      'pt': 'Meu Perfil',
      'en': '',
    },
    '04corg7k': {
      'pt': 'Home',
      'en': '',
    },
  },
  // historico
  {
    '77hjcn4t': {
      'pt': 'Histórico',
      'en': '',
    },
    'obg63dp6': {
      'pt': 'Atualizar',
      'en': '',
    },
    'ta8viwkb': {
      'pt': 'Avaliação: ',
      'en': '',
    },
    'q1xuofpi': {
      'pt': 'Coletor',
      'en': '',
    },
    'xfrdpdza': {
      'pt': '-',
      'en': '',
    },
    'tzwjnvnk': {
      'pt': 'Home',
      'en': '',
    },
  },
  // homePageColetor
  {
    'c7qwxpqo': {
      'pt': 'Reciclapp',
      'en': '',
    },
    'p6y7xnll': {
      'pt': '',
      'en': '',
    },
    'r7ro9w4d': {
      'pt': 'Atualizar',
      'en': '',
    },
    '4ici6nyp': {
      'pt': 'Coletas Disponíveis ',
      'en': '',
    },
    'yrqs576i': {
      'pt': 'Ver Mais',
      'en': '',
    },
    'ql03uwes': {
      'pt': 'Coletas Agendadas',
      'en': '',
    },
    '06sx8q8s': {
      'pt': 'Ver Mais',
      'en': '',
    },
    '0qknngdc': {
      'pt': 'Home',
      'en': '',
    },
  },
  // historicoColetor
  {
    'fnyu7eoi': {
      'pt': 'Histórico',
      'en': '',
    },
    'b2xt2jki': {
      'pt': 'Atualizar',
      'en': '',
    },
    'nluq6u8b': {
      'pt': 'Avaliação ',
      'en': '',
    },
    'y4k1261k': {
      'pt': 'Solicitante',
      'en': '',
    },
    'fyxv5o21': {
      'pt': 'Home',
      'en': '',
    },
  },
  // profilePageColetor
  {
    'cqmcwnqx': {
      'pt': 'Nome',
      'en': '',
    },
    'hprtxvh1': {
      'pt': 'Nome',
      'en': 'Nome',
    },
    'yfztrxmt': {
      'pt': 'Cep',
      'en': '',
    },
    '0xzjyx3k': {
      'pt': 'Cep',
      'en': '',
    },
    '4eix4h2l': {
      'pt': 'Estado',
      'en': '',
    },
    '2s2u49iz': {
      'pt': 'Estado',
      'en': '',
    },
    '06zf83b1': {
      'pt': 'Cidade',
      'en': '',
    },
    'qho93mky': {
      'pt': 'Cidade',
      'en': '',
    },
    'cqnhrzrj': {
      'pt': 'Bairro',
      'en': '',
    },
    '52kjzoms': {
      'pt': 'Bairro',
      'en': '',
    },
    'xv9fj8gg': {
      'pt': 'Rua',
      'en': '',
    },
    'gx6qylaa': {
      'pt': 'Rua',
      'en': '',
    },
    'b4senqhp': {
      'pt': 'Número ',
      'en': '',
    },
    'ls1xx43w': {
      'pt': 'Numero',
      'en': '',
    },
    'lpscglue': {
      'pt': 'Complemento',
      'en': '',
    },
    'xal72jmz': {
      'pt': 'Complemento',
      'en': '',
    },
    'aa5v6rvf': {
      'pt': 'Sair',
      'en': '',
    },
    'etgmtmgh': {
      'pt': 'Salvar',
      'en': '',
    },
    'ulzvzylu': {
      'pt': 'Nome é obrigatório',
      'en': '',
    },
    'opvbe2kb': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'dbytagm3': {
      'pt': 'Insira um Cep',
      'en': '',
    },
    'tl7a3y7p': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'w65pi278': {
      'pt': 'Insira um Estado',
      'en': '',
    },
    '2lxxxksn': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'iklujwa8': {
      'pt': 'Insira uma Cidade',
      'en': '',
    },
    '1oa2vgkf': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'g9j6m1fo': {
      'pt': 'Insira um Bairro',
      'en': '',
    },
    'kpdr8dqh': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '46ut433c': {
      'pt': 'Insira uma Rua',
      'en': '',
    },
    '1s136edw': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'jcmiolv8': {
      'pt': 'Insira um Número',
      'en': '',
    },
    'ibqkgftv': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '2w9t8rcn': {
      'pt': 'complemento is required',
      'en': '',
    },
    'ilq1hbhl': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ife335c4': {
      'pt': 'TextField is required',
      'en': '',
    },
    'e8bi6t9j': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'k4jnnx3k': {
      'pt': 'Meu Perfil',
      'en': '',
    },
    'g9ijawad': {
      'pt': 'Home',
      'en': '',
    },
  },
  // redirectPage
  {
    '4rvfa2zi': {
      'pt': 'Home',
      'en': '',
    },
  },
  // adicionarColeta
  {
    'ip5ajiu5': {
      'pt': 'Escolha uma data para a coleta',
      'en': '',
    },
    '2li2ho4x': {
      'pt': 'Agendar',
      'en': '',
    },
    'xla5rxkp': {
      'pt':
          'Para poder agendar coletas por favor preencha o\nendereço completo na página do seu perfil.',
      'en': '',
    },
  },
  // aceitarColeta
  {
    '6u5uugl4': {
      'pt': 'Detalhes da coleta',
      'en': '',
    },
    'vjnakmk5': {
      'pt': 'Endereço',
      'en': '',
    },
    'hrv4xevm': {
      'pt': 'Por favor dê uma nota para esta coleta!',
      'en': '',
    },
    '4net91ow': {
      'pt': 'Descrição',
      'en': '',
    },
    'hs3tasrd': {
      'pt': 'Escreva uma Descrição sobre a Coleta',
      'en': '',
    },
    'prwa4qbl': {
      'pt': 'CANCELAR',
      'en': '',
    },
    's5bh1iwn': {
      'pt': 'Aceitar',
      'en': '',
    },
    'zfcumi3b': {
      'pt': 'Finalizar Coleta',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '8duyvj9i': {
      'pt': '',
      'en': '',
    },
    'eq37ibdx': {
      'pt': '',
      'en': '',
    },
    'k21vq1nh': {
      'pt': '',
      'en': '',
    },
    'gmbhdg9q': {
      'pt': '',
      'en': '',
    },
    '9bgextzd': {
      'pt': '',
      'en': '',
    },
    'sc4tiy9o': {
      'pt': '',
      'en': '',
    },
    '8mwcacog': {
      'pt': '',
      'en': '',
    },
    '3jtyte6q': {
      'pt': '',
      'en': '',
    },
    'i0n8x76u': {
      'pt': '',
      'en': '',
    },
    'qc9yqzt5': {
      'pt': '',
      'en': '',
    },
    'dzdfk6hq': {
      'pt': '',
      'en': '',
    },
    'iaczybr8': {
      'pt': '',
      'en': '',
    },
    '17n11lff': {
      'pt': '',
      'en': '',
    },
    '4cshrl33': {
      'pt': '',
      'en': '',
    },
    'juchwxgx': {
      'pt': '',
      'en': '',
    },
    'fpe5t8fk': {
      'pt': '',
      'en': '',
    },
    't1rvs942': {
      'pt': '',
      'en': '',
    },
    'csnrhkut': {
      'pt': '',
      'en': '',
    },
    'd9j5rg3r': {
      'pt': '',
      'en': '',
    },
    '2vxm17m5': {
      'pt': '',
      'en': '',
    },
    'eqmlygaz': {
      'pt': '',
      'en': '',
    },
    's2hsy9gn': {
      'pt': '',
      'en': '',
    },
    '6s27m73g': {
      'pt': '',
      'en': '',
    },
    'ddlh2q23': {
      'pt': '',
      'en': '',
    },
    'bgajibyd': {
      'pt': '',
      'en': '',
    },
    'd5n58uiv': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
