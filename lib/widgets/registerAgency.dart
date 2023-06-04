
import 'package:flutter/material.dart';
import 'package:go2climb/widgets/registerTourist.dart';

import '../screens/home.dart';
class RegisterAgency extends StatefulWidget{
  @override
  _RegisterAgencyFormState createState() => _RegisterAgencyFormState();
}

class _RegisterAgencyFormState extends State<RegisterAgency>{
  bool _obscureText = true;
  late String _name;
  late String _country;
  late String _phone;
  late String _email;
  late String _ruc;
  late String _ubicacion;
  late String description;
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
                "Informacion de la Agencia",
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
                    hintText: "nombre de la agencia",
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
                          hintText: "ruc",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20.0)
                              )
                          )
                      ),
                      onSubmitted: (valor){
                        _ruc = valor;
                        print("el pais es $_ruc");
                      },
                    ),

                  )
                ],
              ),
              TextField(
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                    hintText: "Ubicacion fisica de la agencia",
                ),
                onSubmitted: (valor){
                  _ubicacion = valor;
                },
              ),
              TextField(
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                    hintText: "Descripcion de la agencia",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0)
                        )
                    )
                ),
                onSubmitted: (valor){
                  description = valor;
                },

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
                      "Acepto los terminos y condiciones de Go2Climb",
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
                      child: Text("Continuar"),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPlan()));
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


class RegisterPlan extends StatefulWidget{
  @override
  _RegisterPlanFormState createState() => _RegisterPlanFormState();
}

class _RegisterPlanFormState extends State<RegisterPlan>{
  bool _obscureText = true;
  late String _numeroTarjeta;
  late String _nombreTarjeta;
  late String _cvc;
  late String _mmAA;
  late String _ruc;
  late String _ubicacion;
  late String description;
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
                "Selecciona un plan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
                textAlign: TextAlign.left,
              ),
              Divider(
                height: 18.0,
              ),
              SizedBox(
                height: 200,
                child: Row(
                  children: [
                    Container(
                      width: 110,
                      child: ElevatedButton(

                          child: Column(
                           children:<Widget> [

                             Padding(
                               padding: EdgeInsets.only(
                                   top: 8.0,
                                   bottom: 8.0
                               ),
                               child:  Text("Plan basico",
                               style: TextStyle(
                                 color: Colors.black,
                               ),
                               ),

                             ),
                             Padding(
                               padding: EdgeInsets.all(8.0),
                               child:  Icon(
                                 Icons.key,
                                 color: Colors.orange,
                                 size: 30.0,
                               ),
                             ),
                             Padding(
                               padding: EdgeInsets.all(8.0),
                               child:
                               Text(
                                   "publicar 3 servicios",
                                 style: TextStyle(
                                   color: Colors.black,
                                 ),
                               ),
                             ),
                             Padding(
                               padding: EdgeInsets.only(
                                   top: 8.0,
                                   bottom: 8.0),
                               child:  Text(
                                 "20.00USD",
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize:20.0,
                                   color: Colors.black
                                 ),
                               )
                             ),


                           ],

                          ),
                        onPressed: (){
                      },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                side: BorderSide(color: Colors.lightBlueAccent),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0),
                                ),
                              ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 110,
                      child: ElevatedButton(

                          child: Column(
                            children:<Widget> [

                              Padding(
                                padding: EdgeInsets.only(
                                    top: 8.0,
                                    bottom: 8.0
                                ),
                                child:  Text("Plan Estandar",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child:  Icon(
                                  Icons.key,
                                  color: Colors.grey,
                                  size: 30.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child:
                                Text(
                                    "publicar 10 servicios",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 8.0,
                                      bottom: 8.0),
                                  child:  Text(
                                    "35.00USD",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:20.0,
                                      color: Colors.black
                                    ),
                                  )
                              ),


                            ],

                          ),
                          onPressed: (){
                          }, style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                      side: BorderSide(color: Colors.lightBlueAccent),

                    ),
              ),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
                      ),
                    ),
                    Container(
                      width: 110,
                      child: ElevatedButton(

                          child: Column(
                            children:<Widget> [

                              Padding(
                                padding: EdgeInsets.only(
                                  top: 8.0,
                                  bottom: 8.0
                                ),
                                child:  Text("Plan Premium",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child:  Icon(
                                  Icons.key,
                                  color: Colors.yellowAccent,
                                  size: 30.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child:
                                Text(
                                    "publicar 50 servicios",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 8.0,
                                      bottom: 8.0),
                                  child:  Text(
                                    "45.00USD",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:20.0,
                                      color: Colors.black
                                    ),
                                  )
                              ),


                            ],

                          ),
                          onPressed: (){
                          }, style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            side: BorderSide(color: Colors.lightBlueAccent),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            ),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      ),
                    ),



                  ],
                ),
              ),
              Divider(
                height: 10.0,
              ),

              Text(
                "* El pago se realizara cada mes de forma automatica, puede cancelar en cualquier momento",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              Divider(
                height: 10.0,
              ),
              Text(
                "Metodo de pago",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              ),



              Divider(
                  height: 10.0
              ),
              TextField(
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                    hintText: "Numero de tarjeta debito/credito",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)
                        )
                    )
                ),
                onSubmitted: (valor){
                  _numeroTarjeta = valor;
                },

              ),
              TextField(
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                    hintText: "Nombre del titular de la cuenta",
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0)
                )
                ),
                onSubmitted: (valor){
                  _nombreTarjeta = valor;
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
                          hintText: "MM/AA",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0)
                              )
                          )
                      ),
                      onSubmitted: (valor){
                        _mmAA = valor;
                      },
                    ),

                  ),
                  Expanded(
                    child: TextField(
                      enableInteractiveSelection: false,
                      autofocus: true,
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                          hintText: "CVC/CVV",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20.0)
                              )
                          )
                      ),
                      onSubmitted: (valor){
                        _cvc = valor;
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
                    child:  ElevatedButton(
                      child: Text("Registrarse"),
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