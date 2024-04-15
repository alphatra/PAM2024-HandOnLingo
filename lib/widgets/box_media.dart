import 'package:flutter/material.dart';

class BoxMedia extends StatefulWidget {
  final String imageUrl;
  final String title;
  final double progress;
  final Color progressColor;
  final BoxMediaSize size;

  const BoxMedia({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.progress,
    this.progressColor = Colors.blue,
    this.size = BoxMediaSize.small,
  }) : super(key: key);

  @override
  _BoxMediaState createState() => _BoxMediaState();
}

enum BoxMediaSize { small, large }

class _BoxMediaState extends State<BoxMedia> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallSize = widget.size == BoxMediaSize.small;
        final boxWidth = isSmallSize
            ? constraints.maxWidth / 2 - 16
            : constraints.maxWidth - 32;
        final boxHeight = isSmallSize ? boxWidth : boxWidth * 0.5625; // 16:9 aspect ratio

        return Container(
          width: boxWidth,
          height: boxHeight,
          margin: const EdgeInsets.all(8),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(isSmallSize ? 12 : 16),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: widget.progress,
                      backgroundColor: Colors.grey[300],
                      color: widget.progressColor,
                      minHeight: 6,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}