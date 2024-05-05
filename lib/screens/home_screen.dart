import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handsonling/widgets/box_media.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';

// Klasa Course reprezentująca dane kursu
class Course {
  final int id;
  final String title;
  final String description;
  final String videoUrl;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrl,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      videoUrl: json['video_url'],
    );
  }
}

// Funkcja pomocnicza do pobierania kursów z Supabase
Future<List<Course>> fetchCourses() async {
  final response = await Supabase.instance.client
      .from('courses')
      .select()
      .order('id', ascending: true);

  final data = response;
  return data.map((courseData) => Course.fromJson(courseData)).toList();
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Course> _courses = [];

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  // Funkcja do pobrania kursów i zaktualizowania stanu widgetu
  Future<void> _loadCourses() async {
    final courses = await fetchCourses();
    setState(() {
      _courses = courses;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0d0d0d),
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Hands On Lingo",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(onPressed: null, icon: Icon(CupertinoIcons.bell)),
          IconButton(onPressed: null, icon: Icon(CupertinoIcons.calendar))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 40.0,
                margin: EdgeInsets.symmetric(vertical: 14.0),
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Gap(6),
                    itemCount: _courses.length,
                    itemBuilder: (context, index) {
                      final course = _courses[index];
                      return OutlinedButton(
                        onPressed: () {},
                        child: Text(course.title),
                      );
                    })),
            Text("Ostatnio przerabiane",
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                )),
            Align(
                alignment: Alignment.center,
                child: BoxMedia(
                  imageUrl: 'https://picsum.photos/200/300',
                  title: "asd",
                  progress: 0.75, // Zastąp wartością rzeczywistą
                  progressColor: Colors.green,
                  size: BoxMediaSize.small,
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RotatedBox(
                        quarterTurns: -1,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(minimumSize: Size(88, 36)),
                          onPressed: () {},
                          child: Text("Ukończone"),
                        )),
                    RotatedBox(
                        quarterTurns: -1,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text("W trakcie"),
                        )),
                    RotatedBox(
                        quarterTurns: -1,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text("Wstrzymane"),
                        )),
                  ],
                ),
                Expanded(
                  child: new Container(
                    padding: new EdgeInsets.only(left: 8.0),
                    color: Colors.cyan,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Text(
                          "Name",
                          style: new TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Hi whatsp?",
                          style: new TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
