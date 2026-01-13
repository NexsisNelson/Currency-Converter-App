import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double result = 0.0;
  TextEditingController textEditingController = TextEditingController();

  void convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 100;
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: const Color.fromARGB(218, 2, 8, 7),
        width: 2.0,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: BorderRadius.circular(10),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Currency Converter',
          style: TextStyle(
            color: const Color.fromARGB(255, 250, 248, 248),
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),

      backgroundColor: const Color.fromARGB(235, 185, 239, 185),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "USD ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: textEditingController,
                textAlign: TextAlign.end,
                style: const TextStyle(color: Colors.red, fontSize: 20),
                decoration: InputDecoration(
                  hintText: 'Enter your value here',
                  hintStyle: const TextStyle(color: Colors.green, fontSize: 20),
                  prefixIcon: const Icon(Icons.monetization_on, size: 25),
                  prefixIconColor: Colors.green,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: convert,
                style: const ButtonStyle(
                  elevation: WidgetStatePropertyAll(95),
                  backgroundColor: WidgetStatePropertyAll(
                    Color.fromARGB(255, 252, 9, 9),
                  ),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  minimumSize: WidgetStatePropertyAll(
                    Size(double.infinity, 50),
                  ),
                  shape: WidgetStatePropertyAll(BeveledRectangleBorder()),
                ),
                child: Text('Click Me'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
