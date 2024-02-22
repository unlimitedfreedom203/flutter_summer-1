import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String labelText = "Привет, это приложение!";
  bool isCatImageTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                labelText,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Открываем страницу с гитом
                launcher.launchUrl(Uri.parse("https://stepik.org/lesson/1090357/step/2?unit=1100967"));
              },
              child: const Text("Гит"),
            ),
          ),
          const SizedBox(height: 20),
         Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Открываем страницу СмолГУ
                  launcher.launchUrl(Uri.parse("https://smolgu.ru/"));
                },
                child: const Text("СмолГУ"),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              setState(() {
                isCatImageTapped = !isCatImageTapped;
                labelText = isCatImageTapped ? "Это котик" : "Привет, это приложение!";
              });
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 42),
                child: Image.network(
                  "https://placekitten.com/200/300", // Замените ссылку на изображение котика
                  width: 150,
                  height: 150,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
