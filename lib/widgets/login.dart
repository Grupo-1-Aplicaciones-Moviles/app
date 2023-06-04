import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go2climb/widgets/registerAgency.dart';
import 'package:go2climb/widgets/registerTourist.dart';

import '../screens/home.dart';


class Login extends StatefulWidget{
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<Login>{
  bool _obscureText = true;
  late String _nombre;
  late String _email;
  late  String _password;
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text("Iniciar Sesion",
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
              TextButton(
                child: Text("¿Has olvidado tu contraseña?"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => forgetPassword()));
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    color: Colors.white, // Color del texto resaltado
                    fontWeight: FontWeight.bold, // Estilo de fuente en negrita
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text("Iniciar Sesion"),
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
              Text("¿Aún no tienes una cuenta?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Row(
                children: [
                  Expanded(
                    child:  ElevatedButton(
                      child: Text("Registrate y disfruta tu aventura"),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterTourist()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF9CD4E7)
                      ),
                  ),

                  )

                ],
              ),
              Row(
                children: [
                  Expanded(
                      child:  ElevatedButton(
                          child: Text("Registrate y ofrece servicios turisticos"),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterAgency()));
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

class forgetPassword extends StatelessWidget{

  late String _email;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text("Recuperar Contraseña",
          ),
        ),
      ),
      body: Column(
        children:<Widget> [
          Divider(
            height: 18.0,
          ),
          Text(
            "Ingrese su correo electrónico",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            )
          ),
          Divider(
            height: 18.0,
          ),
          TextField(
            enableInteractiveSelection: false,
            autofocus: true,
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(
              hintText: "correo electrónico",
              labelText: "correo electrónico",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0)
                )
              ),
            onSubmitted: (valor){
              _email = valor;
            },
          ),Divider(
            height: 260.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child:  ElevatedButton(
                  child: Text("Continuar"),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => smsForgetPassword()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF9CD4E7)
                  ),
                ),

              )

            ],
          ),
        ],
      ),
    );


  }
}







class smsForgetPassword extends StatelessWidget{
  late String _codigo;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text("Recuperar Contraseña",
          ),
        ),
      ),
      body: Column(
        children:<Widget> [
          Divider(
            height: 18.0,
          ),
          Text(
              "Ingrese el codigo de recuperacion",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              )
          ),
          Divider(
            height: 18.0,
          ),
          TextField(
            enableInteractiveSelection: false,
            autofocus: true,
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(
                hintText: "Ingrese Codigo",
                labelText: "Ingrese Codigo",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)
                )
            ),
            onSubmitted: (valor){
              _codigo = valor;
            },
          ),Divider(
            height: 260.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child:  ElevatedButton(
                  child: Text("Continuar"),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => newPassword()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF9CD4E7)
                  ),
                ),

              )

            ],
          ),
        ],
      ),
    );


  }
}

class newPassword extends StatelessWidget{
  late String _email;
  bool _obscureText = true;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text("Recuperar Contraseña",
          ),
        ),
      ),
      body: Column(
        children:<Widget> [
          Divider(
            height: 18.0,
          ),
          Text(
              "Ingrese una nueva contraseña",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              )
          ),
          Divider(
            height: 18.0,
          ),
          TextField(
            enableInteractiveSelection: false,
            autofocus: true,
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(
                hintText: "Ingrese Nuevo Correo",
                labelText: "Ingrese Nuevo Correo",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)
                )
            ),
            onSubmitted: (valor){
              _email = valor;
            },
          ),Divider(
            height: 260.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child:  ElevatedButton(
                  child: Text("Finalizar"),
                  onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Login()),
                    (Route<dynamic> route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF9CD4E7)
                  ),
                ),

              )

            ],
          ),
        ],
      ),
    );

  }
}

/*

class RegisterTurist extends StatelessWidget{
  late String _email;
  late String _password;
  bool _obscureText = true;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text("Registrarte",),
        ),
      ),
      body:  ListView(
    padding: EdgeInsets.all(30.0),
    children:<Widget> [
            Divider(
             height: 18.0,
            ),
            Text(
              "Te damos la bienvenida a GO2Climb",
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 15.0,
              ),
             textAlign: TextAlign.center,
            ),
            TextField(
              enableInteractiveSelection: false,
              autofocus: true,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                  hintText: "correo electrónico",
                  labelText: "correo electrónico",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0)

                      )
                  )
              ),
              onSubmitted: (valor){
                _email = valor;
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


      ]
      ),
    );
  }
}
 */