import 'package:flutter/material.dart';
import 'package:news_application/view/loginpage/loginpage.dart';
import 'package:news_application/view/registerationpage/registrationpage.dart';

class Login_and_Register extends StatelessWidget {
   Login_and_Register({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO(243, 131, 50, 1.0),
      body:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "News",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Black color for "News"
                    ),
                  ),
                  TextSpan(
                    text: " App",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // White color for "App"
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Icon(Icons.newspaper,color: Colors.white,size: 100,),
          SizedBox(
            height: 30,
          ),
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: MaterialButton(
             onLongPress: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
             },
             color: Colors.white,
             minWidth:double.infinity,
             height: 50,
             onPressed: (){},child: Text("Login",style: TextStyle(
             color: Color.fromRGBO(243, 131, 50, 1.0),fontSize: 20,fontWeight:
               FontWeight.bold
           ),),),
         ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MaterialButton(
              onLongPress: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegistrationPage()));
              },
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(
                  color:Colors.white,width: 2.0
                )
              ),

              color: Color.fromRGBO(243, 131, 50, 1.0),
              minWidth:double.infinity,
              height: 50,
              onPressed: (){},child: Text("Register",style: TextStyle(
                color: Colors.white
                ,fontSize: 20,fontWeight:
            FontWeight.bold
            ),),),
          )
        ],
      ),
    );
  }
}
