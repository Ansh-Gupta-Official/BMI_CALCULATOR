import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Home(),
      );

  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //make controller global to access anywhere.
  var wController =TextEditingController();
  var ftController =TextEditingController();
  var inController =TextEditingController();
  var result="";
  var bgcolor=Colors.purple.shade100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        //Again wrap with container to fill color in whole background
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI",style: TextStyle(
                  color: Colors.purple,
                  fontSize: 34,
                  fontWeight: FontWeight.w600,

                ),),
                SizedBox(height: 20,),
                TextField(
                  controller: wController,
                  decoration: InputDecoration(
                    label: Text("Enter your weight in kgs"),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,

                ),
                SizedBox(height: 20,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text("Enter your height in feets"),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,

                ),
                SizedBox(height: 20,),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text("Enter your height in inches"),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,

                ),
                SizedBox(height: 30,),
                ElevatedButton(
                    onPressed: (){
                      var w=wController.text;
                      var f=ftController.text;
                      var i= inController.text;

                      if(w!="" && f!="" && i!=""){

                        //BMI CALCUALATION

                        //Converting textfield string values in integer.
                        var iw=int.parse(w);
                        var ift=int.parse(f);
                        var iin=int.parse(i);

                        // formula to cal. bmi is kg/m^2 so convert height into meters
                        //Convert feet into inches
                        var tinch=(ift*12)+iin;
                        //Convering the inches to cm
                        var tcm=tinch*2.54;
                        //Convering the cm into m
                        var tm=tcm/100;

                        //Formula to cal bmi is Weight/(Meter*Meter)
                        var bmi=iw/(tm*tm);

                        //To change color acc to bmi
                        var msg="";

                        if(bmi>25){
                          msg="You're OverWeight !!";
                          bgcolor=Colors.orange.shade200;
                        }
                        else if(bmi<18){
                          msg="You're UnderWeight !!";
                          bgcolor=Colors.red.shade200;
                        }
                        else{
                          msg="You're Healthy !!";
                          bgcolor=Colors.green.shade200;
                        }

                        //setState is used to change in ui on clicking buttom.

                        setState(() {
                          result="\n $msg \n\n  Your BMI is ${bmi.toStringAsFixed(2)}";
                          //toStringAsFixed(2) is used to print digit only two decimal place
                        });




                      }
                      else{
                        setState(() {
                          result ="Fill all the required blanks !";
                        });
                      }
                    },
                    child: Text("Calculate",)),
                SizedBox(height: 10,),
                Text(result,style: TextStyle(
                  fontSize: 15,
                ),)
              ],
            ),
          ),
        ),
      ),
    ) ;
  }
}

