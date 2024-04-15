import 'package:flutter/material.dart';
import 'package:handsonling/widgets/box_media.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          padding
        Text("sad"),
        BoxMedia(
          imageUrl: 'https://picsum.photos/200/300',
          title: 'Powitania 1',
          progress: 0.75,
          progressColor: Colors.green,
          size: BoxMediaSize.small,
        ),
        Text("Asd"),
        BoxMedia(
          imageUrl: 'https://picsum.photos/200/300',
          title: 'Powitania 1',
          progress: 0.75,
          progressColor: Colors.green,
          size: BoxMediaSize.large,
        )
      ],)
    );
  }
}