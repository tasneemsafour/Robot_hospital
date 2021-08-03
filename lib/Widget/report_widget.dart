import 'package:flutter/material.dart';
import 'package:hospital_application/Screens/reports_Screen.dart';
import '../Screens/reportImage_screen.dart';
class reportItem extends StatelessWidget {

   String reportImag ;
   reportItem({
   this.reportImag
  });
 void selectedReprt(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      reportImage.routeName,
      arguments: {
         reportImag
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ()=> selectedReprt(context),
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column (
          children :<Widget>[
             Stack(
               children: [
                 ClipRRect(
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(20),
                     topRight: Radius.circular(20)
                   ),
                   child: Image.network(
                         reportImag,
                         height: 250,
                         width: double.infinity,
                         fit: BoxFit.cover,
                   ),
                 ),
                Positioned(
                  top: 0,
                  child:
                   Container(
                    padding: EdgeInsets.all(10),
                    width: 350,
                    color: Colors.white54,
                    child:Text( "title" ,style: Theme.of(context).textTheme.bodyText1,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                     ),
                  ),
                )
               ], 
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:<Widget> [
                    Row(
                      children:<Widget> [
                        Icon(Icons.schedule),
                        SizedBox(width: 5,),
                        //Text('$duration min')
                      ],
                    ),
                    Row(
                      children:<Widget> [
                        Icon(Icons.work),
                        SizedBox(width: 5,),
                        //Text(complexityText)
                      ],
                    ),
                    Row(
                      children:<Widget> [
                        Icon(Icons.attach_money),
                        SizedBox(width: 5,),
                        //Text(affordabilityText)
                      ],
                    )
                  ],
                ),
              )
            ]
          ),
        )
      );
  }
}