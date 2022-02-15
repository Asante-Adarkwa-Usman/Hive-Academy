import 'package:flutter/material.dart';
import 'package:hive_academy/shared_widgets/hexagon_button.dart';

class CourseCardView extends StatelessWidget {
  final String? courseTitle;
  final String? courseDescription;
  final String? courseImage;
  final String? completionStatus;
  final void Function()? onTap;
  const CourseCardView(
      {Key? key,
      required this.courseTitle,
      required this.courseDescription,
      this.courseImage,
      required this.completionStatus,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.40,
        child: Card(
          elevation: 2,
          child: Column(
            children: <Widget>[
              Stack(
                fit: StackFit.loose,
                clipBehavior: Clip.none,
                children: [
                  Image.network(
                    courseImage ??
                        'http://www.5ants.com/wp-content/uploads/2016/11/pcgame2-1-830x420.jpg',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    bottom: -70,
                    top: 0,
                    left: 0,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: HexagonButton(
                        width: 28,
                        child: Text(
                          'Free',
                          style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 10,
                          ),
                        ),
                        onTap: null,
                        color: Colors.white,
                        margin: const EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  courseTitle ?? 'Game Development With Unity 3D',
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.visible),
                ),
              ),
              const SizedBox(height: 8),
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  courseDescription ??
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo',
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, color: Colors.grey[800]),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 12, 0, 2),
                child: Column(
                  children: [
                    Text(
                      completionStatus ?? '0',
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    const Text(
                      'Lessons',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
