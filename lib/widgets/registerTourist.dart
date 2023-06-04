
import 'package:flutter/material.dart';
import 'package:go2climb/widgets/registerTourist.dart';

import '../screens/home.dart';
class RegisterTourist extends StatefulWidget{
  @override
  _RegisterTouristFormState createState() => _RegisterTouristFormState();
}

class _RegisterTouristFormState extends State<RegisterTourist>{
  bool _obscureText = true;
  late String _name;
  late String _country;
  late String _phone;
  late String _email;
  late  String _password;
  bool isChecked = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text("Register",
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children:<Widget> [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Te damos la bienvenida a Go2Climb",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
                textAlign: TextAlign.left,
              ),
              Divider(
                height: 18.0,
              ),
              TextField(
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                    hintText: "Correo electronico",
                    labelText: "Correo electronico",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)
                        )
                    )
                ),
                onSubmitted: (valor){
                  _email = valor;
                  print("el email es $_email");
                },
              ),
              TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                    hintText: "Contraseña",
                    labelText: "Contraseña",
                    suffixIcon: IconButton(
                      icon:Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: (){
                        setState(() {
                          _obscureText=!_obscureText;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0)
                        )
                    )
                ),
                onSubmitted: (valor){
                  _password = valor;
                },
              ),
              Text(
                "Informacion de la Cuenta",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
                textAlign: TextAlign.left,
              ),
              Divider(
                  height: 20.0
              ),
              TextField(
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                    hintText: "nombre del usuario",
                    labelText: "nombre del usuario",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)
                        )
                    )
                ),
                onSubmitted: (valor){
                  _name = valor;
                  print("el _name es $_name");
                },

              ),
              Row(
                children: [
                    Expanded(
                        child: TextField(
                          enableInteractiveSelection: false,
                          autofocus: true,
                          textCapitalization: TextCapitalization.characters,
                          decoration: InputDecoration(
                              hintText: "numero de contacto",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0)
                                  )
                              )
                          ),
                          onSubmitted: (valor){
                            _phone = valor;
                            print("el email es $_phone");
                          },
                        ),

                    ),
                  Expanded(
                    child: TextField(
                      enableInteractiveSelection: false,
                      autofocus: true,
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                          hintText: "pais",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20.0)
                              )
                          )
                      ),
                      onSubmitted: (valor){
                        _country = valor;
                        print("el pais es $_country");
                      },
                    ),

                  )
                  ],
              ),
              Divider(
                height: 20.0,
              ),

              Row(
                children: [
                  Expanded(
                      child: Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                  ),
                  Expanded(
                    child: Text(
                      "Declaro tener +18 años de edad",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),

              Divider(
                height: 20.0,
              ),

              Row(
                children: [
                  Expanded(
                    child: Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Declaro tener +18 años de edad",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),


              Row(
                children: [
                  Expanded(
                    child:  ElevatedButton(
                      child: Text("Finalizar"),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF9CD4E7)
                      ),
                    ),

                  )

                ],
              ),

            ],


          )

        ],
      ),
    );
  }

}