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
  String _info = "PRESTAÇÃO APARTAMENTO";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  TextEditingController valorController = TextEditingController();
  TextEditingController contaController = TextEditingController();
  void _resetFields(){
    valorController.text = ''; contaController.text = '';
    setState((){
      _info = "PRESTAÇÃO APARTAMENTO";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _desconto(){
    setState((){
     double valor = double.parse(valorController.text);
    int conta = int.parse(contaController.text);
     double descontoValor;
      double ano = 0;

  

     while(valor <=5000) {
     
      (valor = valor * 2);

       ano++;
      
     }

    switch (conta) {
      case 1:
        descontoValor = ano;
        _info = 'O VALOR DA PARCELA PASSARÁ A SER MAIOR QUE 5000 REAIS EM : ($descontoValor) ANOS';
        break;
        case 2:
        descontoValor = ano;
        _info = 'O VALOR DA PARCELA PASSARÁ A SER MAIOR QUE 5000 REAIS EM : ($descontoValor) ANOS';
        break;
        case 3:
        descontoValor = ano;
        _info = 'O VALOR DA PARCELA PASSARÁ A SER MAIOR QUE 5000 REAIS EM : ($descontoValor) ANOS';
        break;
      default:
        descontoValor = ano;
        _info = 'O VALOR DA PARCELA PASSARÁ A SER MAIOR QUE 5000 REAIS EM : ($descontoValor) ANOS';
    }

    print(descontoValor);
  });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("CALCULAR JUROS PRESTAÇÃO"),
        centerTitle : true,
        backgroundColor: Color.fromARGB(255, 54, 25, 216),
        actions:<Widget>[
          IconButton(icon: const Icon(Icons.account_box), onPressed: _resetFields)
        ],
      ),
      backgroundColor: Color.fromARGB(255, 74, 13, 185),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10,0,10,0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(Icons.person_outline, 
              size: 120.0, 
              color: Color.fromARGB(255, 92, 40, 189)),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "VALOR PRESTAÇÃO: ",
                labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 25.0),
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
                labelText: "DIGITE O NÚMERO DA PARCELA",
                labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 25.0),
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
                  color:Color.fromARGB(255, 64, 11, 189),
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
                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 25),
                )

            ],
          ),
        )
      )
    );
  }

}
