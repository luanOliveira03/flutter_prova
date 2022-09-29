import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget{
  const Home({Key? key}): super(key:key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  String _info = "Informe seus dados.";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  TextEditingController valorController = TextEditingController();
  TextEditingController contaController = TextEditingController();
  void _resetFields(){
    valorController.text = ''; contaController.text = '';
    setState((){
      _info = "Colocar informações";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _desconto(){
    setState((){
     double valor = double.parse(valorController.text);
    int conta = int.parse(contaController.text);
     double descontoValor;

    switch (conta) {
      case 1:
        descontoValor = valor;
        _info = 'Cliente comum não tem desconto, Valor novo a pagar: ($descontoValor)';
        break;
        case 2:
        descontoValor = valor - valor*10/100;
        _info = 'Funcionário tem 10% de desconto, Valor novo a pagar: ($descontoValor)';
        break;
        case 3:
        descontoValor = valor - valor*5/100;
        _info = 'Cliente VIP tem 5% de desconto, Valor novo a pagar: ($descontoValor)';
        break;
      default:
        descontoValor = valor;
        _info = 'Valor inválido,  Valor: ($descontoValor)';
    }

    print(descontoValor);
  });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calcular desconto"),
        centerTitle : true,
        backgroundColor: Colors.cyan,
        actions:<Widget>[
          IconButton(icon: const Icon(Icons.account_box), onPressed: _resetFields)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10,0,10,0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(Icons.person_outline, 
              size: 120.0, 
              color: Colors.cyan),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Valor total da Compra: ",
                labelStyle: TextStyle(color: Colors.cyan)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.cyan, fontSize: 25.0),
                controller: valorController,
                validator:(value){
                  if(value!.isEmpty){
                    return "Insira o valor total da compra";
                  }
                  return null;
                },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Digite 1 para Cliente, Digita 2 para Funcionário, Digite 3 para Cliente Vip",
                labelStyle: TextStyle(color: Colors.cyan)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.cyan, fontSize: 25.0),
                controller: contaController,
                validator:(value){
                  if(value!.isEmpty){
                    return "Insira o tipo da conta";
                  }
                  return null;
                },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: SizedBox(
                height: 50,
                child: RaisedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()){
                      _desconto();
                    }
                  },
                  color:Colors.cyan,
                  child: const Text(
                    'Calcular desconto',
                    style: TextStyle(color: Colors.white, fontSize:25.0),
                  ),
                ),
              ),
  
              ),
              Text(
                _info,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.cyan, fontSize: 25),
                )

            ],
          ),
        )
      )
    );
  }

}

// import 'dart:ffi';
// import 'dart:math';

// import 'package:flutter/material.dart';

// void main() async {
//   runApp(MaterialApp(
//     home: const Home(),
//     theme: ThemeData(
//       hintColor: Colors.grey,
//       primaryColor: Colors.lightBlue,
//       inputDecorationTheme: const InputDecorationTheme(
//             enabledBorder:
//                 OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
//             focusedBorder:
//                 OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
//             hintStyle: TextStyle(color: Colors.white))),
//     ));
  
// }

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override 
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final valorController = TextEditingController();
//   final comumController = TextEditingController();
//   final funcionarioController = TextEditingController();
//   final vipController = TextEditingController();

//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
//   late Float comum;
//   late Float funcionario;
//   late Float vip; 
   
  

//   @override
//   Widget build(BuildContext) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text("Saiba o Valor Total a Pagar"),
//         backgroundColor: Colors.cyan[700],
//         centerTitle: true,
//       ),
//     body: SingleChildScrollView(
//      padding: const EdgeInsets.all(10),
//      child: Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [ 
//           const Icon(
//             Icons.date_range,
//             size: 150,
//             color: Color.fromARGB(255, 7, 55, 138),
//           ),
//           construirTextField("Valor Total", "Valor Total: ", valorController, "Campo vazio"),
//           const Divider(),
//           construirTextField("Valor a pagar cliente comum", "Valor a pagar:", comumController, "Campo vazio"),
//           const Divider(),
//           construirTextField("Valor a pagar funcionário", "Valor a pagar:", funcionarioController, "Campo vazio"),
//           const Divider(),
//           construirTextField("Valor a pagar cliente vip", "Valor a pagar:", vipController, "Campo vazio"),
//         ]
//       )
//      ),
//     ),
//     );

//   }
//   Widget construirTextField(String texto, String prefixo, TextEditingController c, String mensagemErro) {
//   return TextFormField(
//     validator: (value) {
//       if (value!.isEmpty) {
//         return mensagemErro;
//       } else {
//         return null;
//       }
//     },
//     controller: c,
//     decoration: InputDecoration(
//       labelText: texto,
//       labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
//       border: const OutlineInputBorder(),
//       prefixText: prefixo),
//       style: const TextStyle(
//         color: Colors.black,
//       ));
//   }

// }