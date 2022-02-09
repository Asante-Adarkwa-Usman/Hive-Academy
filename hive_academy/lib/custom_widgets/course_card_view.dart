
import 'package:flutter/material.dart';
import 'package:hive_academy/shared_widgets/hexagon_button.dart';

class CourseCardView extends StatelessWidget {
  const CourseCardView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     
      height: 250,
      width: 200,
      child: Card(
        elevation: 10,
        // color: Colors.pinkAccent,
        child: Column(
          children: <Widget>[
           
            Stack(
              fit: StackFit.passthrough,
                      clipBehavior: Clip.none,
                      
              children: [
                Image.asset(
              'assets/images/courseImage.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: -100,
              top: 0,
              left: 80,
              child: Container(
                alignment: Alignment.bottomCenter,
                
                child: HexagonButton(
                  width: 34,
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
            )
            
           
          ],
        ),
      ),
    );
  }
}