import 'package:flutter/material.dart';

import 'engine/calculator/calculator.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final expression = ValueNotifier<String>('');
  final result = ValueNotifier<String>('');

  @override
  void initState() {
    expression.addListener(() {
      try {
        final computation = Calculator.calculate(expression.value);
        result.value = computation.toString();
      } catch (exception) {
        debugPrint(exception.toString());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ValueListenableBuilder(
                    valueListenable: expression,
                    builder: (context, value, child) => Text(
                      expression.value,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: result,
                    builder: (context, value, child) {
                      return Text(
                        result.value,
                        style: Theme.of(context).textTheme.displaySmall,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValueButton(
                    value: '7',
                    onTap: (value) => expression.value += value,
                  ),
                  ValueButton(
                    value: '8',
                    onTap: (value) => expression.value += value,
                  ),
                  ValueButton(
                    value: '9',
                    onTap: (value) => expression.value += value,
                  ),
                  ValueButton(
                    value: '/',
                    onTap: (value) => expression.value += value,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValueButton(
                    value: '4',
                    onTap: (value) => expression.value += value,
                  ),
                  ValueButton(
                    value: '5',
                    onTap: (value) => expression.value += value,
                  ),
                  ValueButton(
                    value: '6',
                    onTap: (value) => expression.value += value,
                  ),
                  ValueButton(
                    value: '*',
                    onTap: (value) => expression.value += value,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValueButton(
                    value: '1',
                    onTap: (value) => expression.value += value,
                  ),
                  ValueButton(
                    value: '2',
                    onTap: (value) => expression.value += value,
                  ),
                  ValueButton(
                    value: '3',
                    onTap: (value) => expression.value += value,
                  ),
                  ValueButton(
                    value: '-',
                    onTap: (value) => expression.value += value,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValueButton(
                    value: '0',
                    onTap: (value) => expression.value += value,
                  ),
                  ValueButton(
                    value: '.',
                    onTap: (value) => expression.value += value,
                  ),
                  ValueButton(
                    value: 'D',
                    onTap: (value) {},
                  ),
                  ValueButton(
                    value: '+',
                    onTap: (value) => expression.value += value,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ValueButton extends StatelessWidget {
  final String value;
  final void Function(String value) onTap;

  const ValueButton({
    super.key,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(shape: const CircleBorder()),
      onPressed: () => onTap(value),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(value),
      ),
    );
  }
}
