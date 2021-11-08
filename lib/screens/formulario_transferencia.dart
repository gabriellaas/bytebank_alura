import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Criando transferência'),),
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Editor(controlador: _controladorCampoNumeroConta, rotulo: 'Número da conta', dica: '0000', icone: Icons.account_box),
                Editor(controlador: _controladorCampoValor, rotulo: 'Valor', dica: '0.00', icone: Icons.monetization_on),

                ElevatedButton(onPressed: () {
                  _criaTransferencia(context);
                },
                    child: Text('Confirmar')),
              ],
            )));
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if(numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}