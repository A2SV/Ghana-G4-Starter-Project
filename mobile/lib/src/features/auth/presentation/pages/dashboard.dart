import 'package:flutter/material.dart';
import 'package:starter_project/src/features/auth/presentation/widgets/folder.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
    final List _folders = [
      ["Gaming",20, Color.fromRGBO(255, 168, 0, 1),"🎮"],
      ["Sports",60, Color.fromRGBO(113, 160, 231, 1),"🏀"],
      ["Food",99, Color.fromRGBO(12, 154, 0, 1),"🍔"],
      ["Dresses",80, Color.fromRGBO(73, 7, 240, 1),"👗"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: Builder(
          builder: (context) =>
          IconButton(
          icon: const Icon(Icons.menu),
          onPressed:(){
            Scaffold.of(context).openDrawer();
          } ,
        ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              IconData(0xf237, fontFamily: 'MaterialIcons'),
            ),
            onPressed: () {},
          ),],
      ),
      drawer: Drawer(),
    body: Column(
      
      children: [
        
        const Padding(
          padding: EdgeInsets.fromLTRB(25,25,25,0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
          children: [
            Text("Welcome back,",
            style: TextStyle(
              fontSize: 20
            ),),
            Text('Biniyam',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
          ],
                ),
                Text('We\'ve got some interesting reads for you',
                style: TextStyle(
          fontSize: 12,
                ),),
            ],
          
          ),
        ),
      
      const SizedBox(height: 20,),
      
      Padding(
        padding: const EdgeInsets.only(left : 25.0),
        child: Container(
          height: 150,
          child: ListView.builder(
            
            scrollDirection: Axis.horizontal,
            itemCount: _folders.length,
            itemBuilder: 
          
          (BuildContext context,index) {
            return Folder(type: _folders[index][0], num: _folders[index][1],
          color : _folders[index][2],
          emoji: _folders[index][3],);
          }
          
          
          ),
        ),
      ),
    
    ]
    
    ,),
    
    )
    
    ;
  }
}