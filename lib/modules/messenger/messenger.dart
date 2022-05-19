import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class Messenger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/1.jpg"),
              radius: 20,
            ),
            SizedBox(
              width: 20,
            ),
            Text("Chats",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),),
          ],
        ),
        actions: [
          IconButton(
              icon: CircleAvatar(
                radius: 20,
                child: Icon(Icons.camera_alt,
                size: 20,
                ),
              ),
              onPressed: (){},
          ),
          IconButton(
            icon: CircleAvatar(
              radius: 20,
              child: Icon(Icons.edit,
                size: 20,
              ),
            ),
            onPressed: (){},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10,),
                    Text("Search"),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 100,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>buildStoryItem(),
                    separatorBuilder: (context,index)=>SizedBox(width: 20,),
                    itemCount: 10,
                ),
              ),
              SizedBox(height: 20,),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index)=>buildChatItem(),
                separatorBuilder: (context,index)=>SizedBox(height: 15,),
                itemCount: 10,
              ),

            ],
          ),
        ),
      ),
    );
  }


  Widget buildChatItem()=>Row(
    children: [
      Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/1.jpg"),
            radius: 30,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3,
              end: 3,
            ),
            child: CircleAvatar(
              radius: 7,
              backgroundColor: Colors.green[500],
            ),
          ),
        ],
      ),
      SizedBox(width: 20,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mostafa Bahr",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Expanded(child: Text("Mostafa Ahmed Bahr Mostafa Ahmed Bahr Mostafa Ahmed BahrMostafa Ahmed Bahr Mostafa Ahmed Bahr",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,),
                ),
                Text("02:00 pm"),
              ],
            ),
          ],
        ),
      ),
    ],
  );
  Widget buildStoryItem()=>Container(
    width: 60,
    child: Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/1.jpg"),
              radius: 30,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3,
                end: 3,
              ),
              child: CircleAvatar(
                radius: 7,
                backgroundColor: Colors.green[500],
              ),
            ),
          ],
        ),
        SizedBox(height: 6,),
        Text("Mostafa Ahmed Bahr",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,),
      ],
    ),
  );
}
