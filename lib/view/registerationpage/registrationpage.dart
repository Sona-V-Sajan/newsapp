import 'package:flutter/material.dart';
import 'package:news_application/view/loginpage/loginpage.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.white,size:30
          ),
          backgroundColor:Color.fromRGBO(243, 131, 50, 1.0),
          title: Row(
            children: const [
              SizedBox(width: 8.0),
              Text("Registration Page",style: TextStyle(fontSize:25,fontWeight:FontWeight.bold, color: Colors.white),),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.center,
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
                          color:Color.fromRGBO(243, 131, 50, 1.0) // Black color for "News"
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

            SizedBox(
              height:10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical:10),
              child: TextField(
                decoration:InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderSide:BorderSide(
                            color:Color.fromRGBO(243, 131, 50, 1.0),width: 2.0
                        )
                    ),
                    hintText: "Email"
                ),
              ),
            ),

            SizedBox(
              height:10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical:10),
              child: TextField(
                decoration:InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(
                        borderSide:BorderSide(
                            color:Color.fromRGBO(243, 131, 50, 1.0),width: 2.0
                        )
                    ),
                    hintText: "Username"
                ),
              ),
            ),
            SizedBox(
              height:10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical:10),
              child: TextField(
                obscureText: true,
                decoration:InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderSide:BorderSide(
                            color:Color.fromRGBO(243, 131, 50, 1.0),width: 2.0
                        )
                    ),
                    hintText: "Password"
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MaterialButton(
                onLongPress: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                },
                color: Color.fromRGBO(243, 131, 50, 1.0),
                minWidth:double.infinity,
                height: 50,
                onPressed: (){},child: Text("Register",style: TextStyle(
                  color: Colors.white,fontSize: 20,fontWeight:
              FontWeight.bold
              ),),),
            ),
          ],
        )
    );
  }
}
