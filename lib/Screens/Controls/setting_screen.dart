import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital_application/Screens/Controls/movementAction.dart';
import '../../Widget/limits_Widget.dart';
import 'package:flutter/src/rendering/box.dart';

class Setting_Screen extends StatefulWidget {
    static String routeName ='/setting';
  @override
  _Setting_ScreenState createState() => _Setting_ScreenState();
}

class _Setting_ScreenState extends State<Setting_Screen> {
  
  static List <double>  minList=[];
  static List <double> maxList=[];
  int numOfLimits=5;
   double min ;
   double max ;
  int indexControl =0 ; 
  static List<TextEditingController> minValControl = List.generate(10, (i) => TextEditingController()) ;
  static List<TextEditingController> maxValControl = List.generate(10, (i) => TextEditingController()) ;

  void submitLimits() {
    for (int i = 0 ; i < numOfLimits ; i ++){
    min= double.parse(minValControl[i].text);
    max=double.parse(maxValControl[i].text);
    minList.add (min);
    maxList.add(max);
    print("min  :"+ minList[i].toString()+"  max  :"+ maxList[i].toString());
    }
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title:Text("Setting Limits" , style: 
       TextStyle(color: Colors.white),)
     ),
     body:SingleChildScrollView(
       child:Container(
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,
       child: new Column(
        children: <Widget>[
            ListView .builder(
               shrinkWrap: true,
               itemBuilder: (ctx,index){ 
                 return LimitsWidget(context , index);
                 },
               itemCount: numOfLimits,),
           SizedBox(
              height:50
            ),    
           GestureDetector(  
                onTap:(){ 
                   submitLimits();
                   print("object");
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MovementAction(maxList:maxList  , minList:minList , numOfLimits:numOfLimits);
                }));},
                child: Container(
                    padding: EdgeInsets.all(17),
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0)),
                          color: Theme.of(context).primaryColor),
                    child: Text('Movement Configration', style:TextStyle(
                          fontWeight: FontWeight.bold ,
                          color: Colors.white
                          )
                          ),
                  )
            ),
          ]
         ),
       )
       )
     );
   }
   Widget LimitsWidget(BuildContext context ,int index) {
    return  Container (
      padding: const EdgeInsets.all(15.0),
      height: MediaQuery.of(context).size.height*0.13,
      width: MediaQuery.of(context).size.width,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget>[
           Padding(
                  padding: const EdgeInsets.all(25.0),
                  child : Row (
                    children: [
                      Container(
                        //height: MediaQuery.of(context).size.height*0.1,
                        //color: Colors.green,
                        child:Image.asset("assets/images/pngegg.png"),
                        ),
                        Text(" "+(index+1).toString()),
                        ]
                      ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0)),
                        color: Colors.grey[200]),
                  width: 100,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(labelText: ' min'),
                    keyboardType: TextInputType.number,
                    controller: minValControl[index],
                    ),
                ),
                Container(
                   decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0)),
                        color: Colors.grey[200]),
                  height: 50,
                  width:100,
                  child: TextField(
                    decoration: InputDecoration(labelText: '  max'),
                    keyboardType: TextInputType.number,
                    controller: maxValControl[index],
                    //onSubmitted: (_) => submitLimits(),
                        ),
                     ),
                    ],
          )
    
    ) ;
  }
}