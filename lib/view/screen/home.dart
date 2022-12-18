import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tervel_app/helper/model.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  bool isloaded = false;
  List<Product>? userList = [];

  // getData1() async {
  //   userList = postHelper().getPost() as List<GetPost>?;
  //   setState(() {
  //     isloaded = true;
  //   });
  // }






  Future<List<Product>?> getData() async {
    final response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        print(i['title']);

        userList?.add(Product.fromJson(i));
      }
    }
  }

  showExitDialog(){
    return showDialog(context: context,
    builder: (context){
      return AlertDialog(
        // title: Text('Alart !!'),
        content: Text('Are you sure exit this app?'),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: (){
                SystemNavigator.pop();
              }, child: Text('Exit',style: TextStyle(color: Colors.red))),
              SizedBox(width: 20,),
              TextButton(onPressed: (){

                Navigator.pop(context);
              }, child: Text('Close',style: TextStyle(color: Colors.green),)),
            ],
          ),
        ],
      );
    },
    );
  }


  @override
  Widget build(BuildContext context) {
    getData();
    return WillPopScope(
      onWillPop: (){
       return showExitDialog();
      },
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Center(child: Text('Loading..'));


                    } else {

                      return ListView.builder(
                        itemCount: userList?.length,
                        itemBuilder: (context, index) {
                          return Container(

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(

                                children: [

                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //
                                  //   child: Column(
                                  //     crossAxisAlignment: CrossAxisAlignment.start,
                                  //     children: [
                                  //       Text(userList![index].title.toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                                  //       Row(
                                  //         children: [
                                  //           Text('Price: ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                                  //           Text(userList![index].price.toString()),
                                  //         ],
                                  //       )
                                  //     ],
                                  //   ),
                                  // ),

                                  // Image.network(userList![index].category!.image.toString()),
                                  //
                                  // Image.network(userList![index].images!.first),
                                  // Text(userList![index].id.toString()),
                                  // Text(userList![index].category!.name.toString()),
                                  // Image.network(userList![index].category!.image.toString())

                                  InkWell(
                                      onTap: (){
                                        showBottomSheet(context: context,

                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(27),topRight: Radius.circular(27))
                                            ),
                                            backgroundColor: Colors.white,
                                            builder: (context){


                                              return   Container(
                                                decoration: BoxDecoration(

                                                    borderRadius: BorderRadius.circular(15)
                                                ),


                                                height: 200,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 18.0,top: 10),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [

                                                        Stack(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                          children: [
                                                            Row(
                                                              children: [
                                                                CircleAvatar(
                                                                    radius:30,
                                                                    backgroundImage: NetworkImage(userList![index].images!.first.toString())




                                                                ),
                                                                SizedBox(width: 15,),

                                                                Text(userList![index].title.toString(),style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                                                              ],
                                                            ),

                                                            // IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close,color: Colors.red,))
                                                            // CircleAvatar( radius:10, backgroundColor: Colors.green, child: Text(userList![index].id.toString(),style: TextStyle(color: Colors.white),)),


                                                          ],
                                                        ),
                                                        Positioned(
                                                            top: 0,right: 0,
                                                            child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close,color: Colors.red,)))
                                                      ],
                                                        ),
                                                        SizedBox(height: 20,),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text('Deccription:',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                                                            Text(userList![index].description.toString()),
                                                          ],
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: ClipRRect(

                                          borderRadius: BorderRadius.circular(20.0),

                                          child: Image.network(userList![index].images!.first.toString()))


                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(userList![index].title.toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Colors.green),),
                                        Row(
                                          children: [
                                            Text('Price: ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),),
                                            Text(userList![index].price.toString(),style: TextStyle(color: Colors.white),),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          )),
    );
  }
}