import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> components = [
    const AlphabetComponent(),
    const DictionaryComponent(),
    const CirclesComponent(),
    const CheckYourselfComponent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Handsonlingo'),
      ),
      body: ListView.separated(
        itemCount: components.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16.0),
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: components[index],
            ),
          );
        },
      ),
    );
  }
}

class AlphabetComponent extends StatelessWidget {
  const AlphabetComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'AABCĆDEEFG\nHIJKLŁMNŃO\nÓPRSŚTUWY',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class DictionaryComponent extends StatelessWidget {
  const DictionaryComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'SŁOWNIK\nMIGOWY',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18.0,
      ),
    );
  }
}

class CirclesComponent extends StatelessWidget {
  const CirclesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 8.0,
          backgroundColor: Colors.blue,
        ),
        SizedBox(width: 8.0),
        CircleAvatar(
          radius: 16.0,
          backgroundColor: Colors.blue,
        ),
        SizedBox(width: 8.0),
        CircleAvatar(
          radius: 24.0,
          backgroundColor: Colors.blue,
        ),
      ],
    );
  }
}

class CheckYourselfComponent extends StatelessWidget {
  const CheckYourselfComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'SPRAWDŹ SIĘ',
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}