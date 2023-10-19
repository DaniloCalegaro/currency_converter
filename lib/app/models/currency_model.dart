class CurrencyModel {
  final String name;
  final String description;
  final String sigla;
  final String simbolo;
  final String banner;
  final double real;
  final double dolar;
  final double euro;

  CurrencyModel(
      {required this.name,
      required this.description,
      required this.sigla,
      required this.simbolo,
      required this.banner,
      required this.real,
      required this.dolar,
      required this.euro});

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel(
          name: 'Real',
          description: 'Brasil real',
          sigla: 'BRA',
          simbolo: 'R\$',
          banner: 'assets/images/bandeira-brasil.png',
          real: 1.0,
          dolar: 0.20,
          euro: 0.15),
      CurrencyModel(
          name: 'Dolar',
          sigla: 'USD',
          simbolo: '\$',
          description: 'Estados Unidos dólar',
          banner: 'assets/images/bandeira-estados-unidos.png',
          real: 4.95,
          dolar: 1,
          euro: 0.85),
      CurrencyModel(
          name: 'Euro',
          sigla: 'GBP',
          simbolo: '€',
          description: 'Reino Unido euro',
          banner: 'assets/images/bandeira-inglaterra.png',
          real: 6.62,
          dolar: 1.17,
          euro: 1.0),
    ];
  }
}
