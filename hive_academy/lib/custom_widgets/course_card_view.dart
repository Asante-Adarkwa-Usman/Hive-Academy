import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_academy/shared_widgets/hexagon_button.dart';

class CourseCardView extends StatelessWidget {
  final String? courseTitle;
  final String? courseDescription;
  final String? courseImage;
  final String? lessons;
  final String? priceTag;
  final bool? userCourse;
  final void Function()? onTap;
  final String? courseBanner;
  const CourseCardView(
      {Key? key,
      required this.courseTitle,
      required this.courseDescription,
      this.courseBanner,
      this.userCourse,
      this.priceTag,
      this.courseImage,
      this.lessons,
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: <Widget>[
              Stack(
                clipBehavior: Clip.none,
                children: [
                  userCourse == false
                      ? CachedNetworkImage(
                          imageUrl: courseBanner.toString(),
                          fit: BoxFit.fitWidth,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.10,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                              strokeWidth: 2,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )
                      : Image.asset('assets/images/logo.png',
                          fit: BoxFit.fitWidth,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.10),
                  userCourse == false
                      ? Positioned.fill(
                          bottom: -75,
                          top: 0,
                          left: 0,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: HexagonButton(
                              width: 28,
                              child: Text(
                                priceTag.toString(),
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
                        )
                      : Container(),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                courseTitle.toString(),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.visible),
              ),
              const SizedBox(height: 4),
              Text(
                courseDescription.toString(),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, color: Colors.grey[800]),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 4, 0, 2),
                child: userCourse == false
                    ? Column(
                        children: [
                          Text(
                            lessons.toString(),
                            style: const TextStyle(
                                fontSize: 11, color: Colors.grey),
                          ),
                          const Text(
                            'Lessons',
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                        ],
                      )
                    : Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
