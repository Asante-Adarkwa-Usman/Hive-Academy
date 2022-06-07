import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCourseCardView extends StatelessWidget {
  final String? courseTitle;
  final String? lessonCount;
  final String? courseImage;
  final String? completionPercentage;
  final String? courseBanner;

  final void Function()? onTap;
  const MyCourseCardView(
      {Key? key,
      required this.courseTitle,
      this.courseBanner,
      this.courseImage,
      this.completionPercentage,
      this.lessonCount,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.40,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: courseBanner.toString(),
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.08,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                    strokeWidth: 2,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
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
              //const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(14, 2, 0, 8),
                    width: MediaQuery.of(context).size.width * 0.16,
                    height: MediaQuery.of(context).size.width * 0.12,
                    child: Card(
                      elevation: 3,
                      color: Theme.of(context).primaryColorDark,
                      shape: CircleBorder(
                        side: BorderSide(
                          color: Theme.of(context).primaryColorDark,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${completionPercentage ?? '10'}%',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 6),
                        child: const Text(
                          'Complete',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(183, 183, 183, 1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Container(
                        margin: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          '${lessonCount ?? '2'} Lessons',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(183, 183, 183, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
