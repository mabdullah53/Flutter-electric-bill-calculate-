
import 'package:electricitybill_calculate/compunents/Button_text.dart';
import 'package:electricitybill_calculate/compunents/colous.dart';
import 'package:electricitybill_calculate/view_screen/providefunctionss.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //TextEditingController unitController = TextEditingController();
  //
  //  int units = 0;
  //  double bill = 0.0;

  // int units = int.tryParse(unitController.text) ?? 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final CalculateBills = Provider.of<Calculatebills>(context,listen: false);
  }
  // void calculateBill(){
  //   setState(() {
  //     if(units > 500 ){
  //       bill = units*57.0;
  //     }else if(units > 300){
  //       bill = units*43.0;
  //     }else{
  //       bill = units*2;
  //       if(units >2000){
  //         bill= units*74.0;
  //       }
  //     }
  //   });
  // }
  // void resetBill(){
  //   setState(() {
  //     units=0;
  //     bill = 0.0;
  //   });
  // }









  @override
  Widget build(BuildContext context) {
    print('build1');
    final CalculateBills = Provider.of<Calculatebills>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: 0.4,
                image: NetworkImage('https://images.pexels.com/photos/266688/pexels-photo-266688.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                ),
                fit: BoxFit.cover
              )
            ),
          ),
          Consumer<Calculatebills>(
              builder: (context,value, child){
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 350,left: 5),
                        child: CreativeText(title: 'ElectricCity Bill Caculate'),
                      ),

                      SizedBox(height: 30,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          style: TextStyle(color: AppColour.WhiteColour),
                          cursorColor: AppColour.WhiteColour,
                          onChanged: (value){
                            Provider.of<Calculatebills>(context,listen: false).calculateBill(int.tryParse(value) ?? 0);
                            //units= int.tryParse(value) ?? 0;
                          },
                          keyboardType: TextInputType.number,
                          // focusNode: emailFocusNode,
                          //  obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:  BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: AppColour.WhiteColour
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: AppColour.WhiteColour
                              ),
                            ),
                            hintText: 'Enter Units Calculate',hintStyle: TextStyle(
                              color: AppColour.WhiteColour
                          ),
                            labelText: 'Enter Units Calculate',labelStyle: TextStyle(
                              color:  AppColour.WhiteColour
                          ),
                            //  prefixIcon: Icon(Icons.alternate_email,color: AppColor.whiteColor,),
                          ),
                        ),
                      ),

                      SizedBox(height: 20,),

                      CreativeText(title: 'Total BILL'),

                      SizedBox(height: 20,),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 53,),

                            child: Text("Your bill amount is \$${value.bill}",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: AppColour.WhiteColour
                              ),),
                          ),
                          SizedBox(width: 25,),
                          GestureDetector(
                              onTap: (){
                                print('build2');
                                Provider.of<Calculatebills>(context,listen: false).resetBill();
                              },
                              child: Icon(Icons.rotate_left_outlined,color: AppColour.Orange,size: 30,))
                        ],
                      ),
                      SizedBox(height: 30,),

                      GestureDetector(
                        onTap: (){
                           Provider.of<Calculatebills>(context,listen: false).billDisplay();
                        },
                        child: Container(
                          height: 65,
                          width: 255,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                  color: AppColour.WhiteColour
                              )
                          ),

                          child: Center(child: Text('Calculate',style: TextStyle(
                              color: AppColour.WhiteColour,
                              fontSize: 17,
                          ),)),
                        ),
                      )
                    ],
                  ),
                );
              } //
          ),//

        ],
      )
    );
  }
}
