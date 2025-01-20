import 'package:flutter/material.dart';

class CountrySelectorScreen extends StatefulWidget {
  @override
  _CountrySelectorScreenState createState() => _CountrySelectorScreenState();
}

class _CountrySelectorScreenState extends State<CountrySelectorScreen> {
  final List<String> countries = [
    'Афганистан',
    'Албания',
    'Алжир',
    'Андорра',
    'Ангола',
    'Антигуа и Барбуда',
    'Аргентина',
    'Армения',
    'Австралия',
    'Австрия',
    'Азербайджан',
    'Багамы',
    'Бахрейн',
    'Бангладеш',
    'Барбадос',
    'Беларусь',
    'Бельгия',
    'Белиз',
    'Бенин',
    'Бутан',
    'Боливия',
    'Босния и Герцеговина',
    'Ботсвана',
    'Бразилия',
    'Бруней',
    'Болгария',
    'Буркина-Фасо',
    'Бурунди',
    'Кабо-Верде',
    'Камбоджа',
    'Камерун',
    'Канада',
    'Центральноафриканская Республика',
    'Чад',
    'Чили',
    'Китай',
    'Колумбия',
    'Коморы',
    'Конго (Браззавиль)',
    'Коста-Рика',
    'Хорватия',
    'Куба',
    'Кипр',
    'Чехия',
    'Демократическая Республика Конго',
    'Дания',
    'Джибути',
    'Доминика',
    'Доминиканская Республика',
    'Эквадор',
    'Египет',
    'Сальвадор',
    'Экваториальная Гвинея',
    'Эритрея',
    'Эстония',
    'Эсватини (бывш. Свазиленд)',
    'Эфиопия',
    'Фиджи',
    'Финляндия',
    'Франция',
    'Габон',
    'Гамбия',
    'Грузия',
    'Германия',
    'Гана',
    'Греция',
    'Гренада',
    'Гватемала',
    'Гвинея',
    'Гвинея-Бисау',
    'Гайана',
    'Гаити',
    'Гондурас',
    'Венгрия',
    'Исландия',
    'Индия',
    'Индонезия',
    'Иран',
    'Ирак',
    'Ирландия',
    'Израиль',
    'Италия',
    'Кот-д\'Ивуар',
    'Ямайка',
    'Япония',
    'Иордания',
    'Казахстан',
    'Кения',
    'Кирибати',
    'Северная Корея',
    'Южная Корея',
    'Кувейт',
    'Киргизия',
    'Лаос',
    'Латвия',
    'Ливан',
    'Лесото',
    'Либерия',
    'Ливия',
    'Лихтенштейн',
    'Литва',
    'Люксембург',
    'Мадагаскар',
    'Малави',
    'Малайзия',
    'Мальдивы',
    'Мали',
    'Мальта',
    'Маршалловы Острова',
    'Мавритания',
    'Маврикий',
    'Мексика',
    'Микронезия',
    'Молдова',
    'Монако',
    'Монголия',
    'Черногория',
    'Марокко',
    'Мозамбик',
    'Мьянма (бывшая Бирма)',
    'Намибия',
    'Науру',
    'Непал',
    'Нидерланды',
    'Новая Зеландия',
    'Никарагуа',
    'Нигер',
    'Нигерия',
    'Северная Македония',
    'Норвегия',
    'Оман',
    'Пакистан',
    'Палау',
    'Панама',
    'Папуа-Новая Гвинея',
    'Парагвай',
    'Перу',
    'Филиппины',
    'Польша',
    'Португалия',
    'Катар',
    'Румыния',
    'Россия',
    'Руанда',
    'Сент-Китс и Невис',
    'Сент-Люсия',
    'Сент-Винсент и Гренадины',
    'Самоа',
    'Сан-Марино',
    'Сан-Томе и Принсипи',
    'Саудовская Аравия',
    'Сенегал',
    'Сербия',
    'Сейшельские Острова',
    'Сьерра-Леоне',
    'Сингапур',
    'Словакия',
    'Словения',
    'Соломоновы Острова',
    'Сомали',
    'Южная Африка',
    'Южный Судан',
    'Испания',
    'Шри-Ланка',
    'Судан',
    'Суринам',
    'Швеция',
    'Швейцария',
    'Сирия',
    'Тайвань',
    'Таджикистан',
    'Танзания',
    'Таиланд',
    'Тимор-Лешти',
    'Того',
    'Тонга',
    'Тринидад и Тобаго',
    'Тунис',
    'Турция',
    'Туркменистан',
    'Тувалу',
    'Уганда',
    'Украина',
    'Объединенные Арабские Эмираты',
    'Соединенное Королевство',
    'Соединенные Штаты Америки',
    'Уругвай',
    'Узбекистан',
    'Вануату',
    'Ватикан',
    'Венесуэла',
    'Вьетнам',
    'Йемен',
    'Замбия',
    'Зимбабве'
  ];

  List<String> filteredCountries = [];
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    filteredCountries = countries;
  }

  void _filterCountries(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredCountries = countries;
      } else {
        filteredCountries = countries
            .where((country) =>
                country.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _startSearch() {
    setState(() {
      isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      isSearching = false;
      searchController.clear();
      _filterCountries('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                controller: searchController,
                autofocus: true,
                onChanged: _filterCountries,
                decoration: InputDecoration(
                  hintText: 'Поиск...',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            : Text(
                'Выбор страны/региона',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            if (isSearching) {
              _stopSearch();
            } else {
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          if (!isSearching)
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              onPressed: _startSearch,
            )
          else
            IconButton(
              icon: Icon(Icons.clear, color: Colors.white),
              onPressed: _stopSearch,
            ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredCountries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredCountries[index]),
            onTap: () {
              Navigator.pop(context, filteredCountries[index]);
            },
          );
        },
      ),
    );
  }
}
