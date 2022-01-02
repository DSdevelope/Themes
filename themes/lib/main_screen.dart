import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _totalPrice = 0;
  var _doughPrice = 0;
  var _sizePrice = 0;
  var _cheesePrice = 0;
  var _pizzaSize = 0;
  var _radiobuttonGroupValue = 1;
  var _cheeseSwitchValue = false;

  var _tabTextIndexSelected = 0;
  double _sliderValue = 0;

  final _doughPrices = [0, 45];
  final _sizePrices = [350, 500, 650];
  final _pizzaSizes = [25, 33, 40];
  final _listTextTabToggle = ["Обычное тесто", "Тонкое тесто"];

  @override
  Widget build(BuildContext context) {
    _pizzaSize = _pizzaSizes[_sliderValue.toInt()];
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset('assets/pizza.png', width: 330,)
            ),
            const SizedBox(height: 16),
            Text(
              'Калькулятор пиццы',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 10),
            Text(
              'Выберите параметры:',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 30),
            FlutterToggleTab(
              width: 95,
              borderRadius: 30,
              height: 45,
              selectedIndex: _tabTextIndexSelected,
              selectedBackgroundColors:
              [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.primaryVariant],
              selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
              unSelectedTextStyle: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
              labels: _listTextTabToggle,
              selectedLabelIndex: (index) {
                setState(() {
                  _tabTextIndexSelected = index;
                  _doughPrice = _doughPrices[index];
                  _calculateTotalPrice();
                });
              },
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Размер:   $_pizzaSize см.',
                style: const TextStyle(fontSize: 26),
              ),
            ),
            const SizedBox(height: 8),
            Slider(
              divisions: 2,
              min: 0,
              max: 2,
              value: _sliderValue,
              onChanged: (val) {
                setState(() {
                  _sliderValue = val;
                  _sizePrice = _sizePrices[val.toInt()];
                  _calculateTotalPrice();
                });
              }
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Соус:',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            RadioListTile<int>(
              title: const Text('Острый', style: TextStyle(fontSize: 22)),
              value: 1,
              groupValue: _radiobuttonGroupValue,
              onChanged: (val) {
                setState(() {
                  _radiobuttonGroupValue = val!;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            const Divider(height: 8),
            RadioListTile<int>(
              title: const Text('Кисло-сладкий', style: TextStyle(fontSize: 22)),
              value: 2,
              groupValue: _radiobuttonGroupValue,
              onChanged: (val) {
                setState(() {
                  _radiobuttonGroupValue = val!;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            const Divider(height: 8),
            RadioListTile<int>(
              title: const Text('Сырный', style: TextStyle(fontSize: 22)),
              value: 3,
              groupValue: _radiobuttonGroupValue,
              onChanged: (val) {
                setState(() {
                  _radiobuttonGroupValue = val!;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            const Divider(height: 8),
            const SizedBox(height: 20),
            SwitchListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              contentPadding: const EdgeInsets.all(10),
              tileColor: Colors.black.withOpacity(0.1),
              title: const Text('Дополнительный сыр', style: TextStyle(fontSize: 22)),
              secondary: Image.asset(
                "assets/cheese.png",
                height: 40,
                color: Colors.orange),
              value: _cheeseSwitchValue,
              onChanged: (val) {
                setState(() {
                  _cheeseSwitchValue = val;
                  _cheesePrice = val? 30 : 0;
                  _calculateTotalPrice();
                });
              },
            ),
            const SizedBox(height: 12),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Стоимость:',
                style: TextStyle(fontSize: 24,),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Center(
                child: Text(
                  '$_totalPrice руб.',
                  style: const TextStyle(fontSize: 24, color: Colors.purple)
                )
              )
            ),
            const SizedBox(height: 22),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                    )
                )
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Заказать', style: TextStyle(fontSize: 22)),
              ),
            )
          ],
        ),
      )
    );
  }

  int _calculateTotalPrice() => _totalPrice = _doughPrice + _sizePrice + _cheesePrice;
}
