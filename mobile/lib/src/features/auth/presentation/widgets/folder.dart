import 'package:flutter/material.dart';

class Folder extends StatelessWidget {
  final String type;
  final Color color;
  final int num;
  final String emoji;
  Folder({super.key,
  required this.type,
  required this.num,
  required this.color,
  required this.emoji});

  @override
  
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          
          Image.asset('lib/images/Group.png',
          color: this.color,),
        
          Positioned(
            top: 30,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              height: 30,
              width: 30,
           
            ),
          ),
          Positioned(
            top: 30,
            left: 25,
            child: Text(this.emoji,
            style: TextStyle(
              fontSize: 20,
            ),)),
      
          Padding(
            padding: const EdgeInsets.only(left : 15.0 , top:35),
            child: Text('${this.type} \n+${this.num} updates',
            style: TextStyle(fontWeight: 
            FontWeight.w500),),
          ),
        ],
      ),
    );
  }
}