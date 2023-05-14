import 'package:flutter/material.dart';

import '../quizescreen/quizescreen.dart';

class subject_list2 extends StatefulWidget {
  const subject_list2({Key? key}) : super(key: key);

  @override
  State<subject_list2> createState() => _subject_list2State();
}

class _subject_list2State extends State<subject_list2> {
  final List subject_list = const [
    "English" , "Social_science" , "Computer"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black,Colors.blueGrey])
      ),
      child:  SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
        bottomSheet: Container(
          height: 170,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Note : ",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(" > you will have 3 question for each subject",style: TextStyle(color: Colors.white),),
                SizedBox(height: 10,),
                Text(" > you will be given 1min for each question",style: TextStyle(color: Colors.white),),
                SizedBox(height: 10,),
                Text(" > At last your result will be displayed",style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
        ),




        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Let's Start",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
            ),

            GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>quizescreen(title: subject_list[0],index_of_questions: 0,)));
                  },
                  child: Container(
                   height: 190,
                    width: 200,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://as1.ftcdn.net/v2/jpg/02/26/38/60/1000_F_226386084_I3OhtwaCyZe2XnM1t9gd96n7vATnoCzw.jpg'))
                    ),
                    child: Stack(
                      children: [
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.bottomCenter,
                            color: Colors.black.withOpacity(0.5),
                            child: Text("english",style: TextStyle(color: Colors.white,fontSize:20,fontWeight: FontWeight.bold),),
                          )
                      ],
                    )
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>quizescreen(title: subject_list[1],index_of_questions: 1,)));
                  },
                  child: Container(
                      height: 190,
                      width: 200,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage('https://www.mapsofindia.com/ci-moi-images/answers/2020/05/map-of-india-showing-location-of-the-monuments-of-mughal-era.jpg'))
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.bottomCenter,
                            color: Colors.black.withOpacity(0.5),
                            child: Text("social science",style: TextStyle(color: Colors.white,fontSize:20,fontWeight: FontWeight.bold),),
                          )
                        ],
                      )
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 90,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>quizescreen(title: subject_list[2],index_of_questions: 2,)));
                  },
                  child: Container(
                      height: 190,
                      width: 200,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage('https://www.prometsource.com/sites/default/files/inline-images/38_Atomic_Design_Animation.gif'))
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.bottomCenter,
                            color: Colors.black.withOpacity(0.5),
                            child: Text("computer",style: TextStyle(color: Colors.white,fontSize:20,fontWeight: FontWeight.bold),),
                          )
                        ],
                      )
                  ),
                ),
              ],
            ),
            // ElevatedButton(onPressed: (){
            //  showModalBottomSheet(context: context, builder: (context){
            //    return Container(
            //      height: 200,
            //      width: 200,
            //      color: Colors.red,
            //    );
            //  });
            // }, child: Text("pree me"))
          ],
        ),
        ),
      ),
    );
  }
}
