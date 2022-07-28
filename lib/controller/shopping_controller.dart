import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';
import 'package:new_flut/controller/products.dart';

class check extends StatefulWidget {
  const check({Key? key}) : super(key: key);

  @override
  State<check> createState() => _checkState();
}

class _checkState extends State<check> {
ScrollController controllers=ScrollController();
@override void initState(){
  super.initState();
  controllers.addListener(() { 
    if(controllers.position.pixels==controllers.position.maxScrollExtent){
      //isloading?CircularProgressIndicator():Container();
      
print("end of page");

    }
  //  print(controllers.position.pixels);
    print('max ${controllers.offset}');
  });
}
  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    
    return  GridView.builder(
        controller: controllers,
        itemCount: 40,
         scrollDirection: Axis.vertical,
               shrinkWrap: true,
                   
                    physics:const  ScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                     childAspectRatio: 3/2,
                      mainAxisExtent: 245,),
        itemBuilder: (context,index){
        return ListTile(title: Text("milk"),);
      });
    
  }
}