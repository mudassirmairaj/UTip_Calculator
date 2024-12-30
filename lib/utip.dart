import 'package:flutter/material.dart';
import 'package:fortune_cookie/widgets/bill_amount_field.dart';
import 'package:fortune_cookie/widgets/person_counter.dart';
import 'package:fortune_cookie/widgets/tip_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int _personCount = 1;
  double _tipPercentage = 0.0; //0% - 50% tip
  // total Bill
  double _billTotal = 0.0;

  double totalPerPerson() {
    return ((_billTotal * _tipPercentage) + (_billTotal)) / _personCount;
  }

  //Function to do the task.

  void increment() {
    setState(() {
      _personCount++;
    });
  }

  void decrement() {
    setState(() {
      if (_personCount > 0) {
        _personCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double total = totalPerPerson();
    print('total: $total');
    print(_billTotal);
    print('person $_personCount');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: GoogleFonts.raleway(),
        ),
      ),
      // Body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text(
                      'Total Per Person',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: theme.colorScheme.onPrimary),
                    ),
                    Text(
                      '\$ ${total}',
                      style: theme.textTheme.titleLarge!
                          .copyWith(color: theme.colorScheme.onPrimary),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(.6),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    BillAmountField(
                      billAmount: 'Bill Amount',
                      onChanged: (value) {
                        setState(() {
                          _billTotal = double.parse(value);
                          print(_billTotal);
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    PersonCounter(
                      theme: theme,
                      personCount: _personCount,
                      onIncrement: increment,
                      onDecrement: decrement,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tip'),
                        Text('\$20.12'),
                      ],
                    ),
                    Text('${(_tipPercentage * 100).round()}%'),
                    TipSlider(
                      tipPercentage: _tipPercentage,
                      onChanged: (value) {
                        setState(() {
                          _tipPercentage = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
