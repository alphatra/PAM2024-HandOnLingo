import 'package:handsonling/screens/home_screen.dart'; // Import modelu Course
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseScreen extends StatefulWidget {
  final int courseId;

  const CourseScreen({Key? key, required this.courseId}) : super(key: key);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  Course? _course;

  @override
  void initState() {
    super.initState();
    _fetchCourse();
  }

  Future<void> _fetchCourse() async {
    final response = await Supabase.instance.client
        .from('courses')
        .select()
        .eq('id', widget.courseId)
        .single();

    if (response.isEmpty) {
      final courseData = response;
      print('Pobrane dane kursu: $courseData');
      setState(() {
        _course = Course.fromJson(courseData);
      });
    } else {
      print('Błąd podczas pobierania danych kursu: ${response}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_course?.title ?? 'Kurs'),
      ),
      body: _course == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_course!.description),
            const SizedBox(height: 16),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.grey,
                child: Center(
                  child: Text('Video Player'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}