import 'package:flutter/material.dart';

class CourseOverview extends StatelessWidget {
  final String? id;
  final String? courseOverview;
  final String? coursePrerequisite;
  final String? courseOutline;
  const CourseOverview(
      {Key? key,
      this.id,
      this.courseOverview,
      this.coursePrerequisite,
      this.courseOutline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OverviewTextContent(content: courseOverview.toString()),
          Divider(
            color: Theme.of(context).primaryColorDark,
            thickness: .5,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
            child: Text('Prerequisites',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 62, 60, 60))),
          ),
          OverviewTextContent(content: coursePrerequisite.toString()),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
            child: Text('What you will learn',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 62, 60, 60))),
          ),
          OverviewTextContent(content: courseOutline.toString()),
        ],
      ),
    );
  }
}

class OverviewTextContent extends StatelessWidget {
  final String? content;
  const OverviewTextContent({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(content.toString(),
          maxLines: 8,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 124, 120, 120),
          )),
    );
  }
}
