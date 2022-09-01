// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:calculo_chapa/telas/tamanho_peca/tamanho_peca.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double precoChapa = 0.00;
  TextEditingController precoDaChapa = MoneyMaskedTextController();

  //TextEditingController precoDaChapa = TextEditingController();
  TextEditingController medidasComprimento = TextEditingController();
  TextEditingController medidasLargura = TextEditingController();

  TextEditingController divisorComprimento = TextEditingController();
  TextEditingController divisorLargura = TextEditingController();

  TextEditingController valorPorcentagem = TextEditingController();
  TextEditingController valorQuantidadePorcentagemController =
      TextEditingController();

  TextEditingController valorAdicionalController = TextEditingController();

  String retornoQtdeMetrosQuad = "Quantidade em metro quadrados:";
  String retornoPrecoPorMetro = r"Preco do metro quadrado R$:";

  String retornoQtdeDePecas = "Quantidade de peças :";
  String retornoCustoPorPeca = r"Custo por peça R$:";

  String retornoDaPorcetagem = r"Valor da porcentagem é : R$";

  String valorTotal = r'Valor total é : R$';

  double comprimento = 0;
  double largura = 0;
  double result_2 = 0;

  double divisorComprimentoPeca = 0;
  double divisorLarguraPeca = 0;

  double resultadoQtdeDePecaDivisor = 0;
  double resultadoValorPorPecas = 0;

  double resultadoDivisorPeca = 0;

  double result_1 = 0;

  double porcentagem = 0;
  double resultadoDaPorcentagem = 0;
  double valorQtdePorcentagem = 0;

  double finalQtdeValorAdicional = 0;

  double valorAdicional = 0;

  void resetaCampos() {
    precoChapa = 0.00;
    precoDaChapa.text = "";
    medidasLargura.text = "";
    medidasComprimento.text = "";
    divisorComprimento.text = "";
    divisorLargura.text = "";
    valorPorcentagem.text = "";
    valorQuantidadePorcentagemController.text = "";
    valorAdicionalController.text = "";

    setState(() {
      retornoQtdeMetrosQuad = "Quantidade em metro quadrados:";
      retornoPrecoPorMetro = r"Preco do metro quadrado R$:";

      retornoQtdeDePecas = "Quantidade de peças :";
      retornoCustoPorPeca = r"Custo por peça R$:";

      retornoDaPorcetagem = r"Valor da porcentagem é : R$";
      valorTotal = r'Valor total é : R$';
    });
  }

  void calcularMedidas() {
    setState(() {
      comprimento = double.parse(medidasComprimento.text) / 1000;
      largura = double.parse(medidasLargura.text) / 1000;
      result_1 = (comprimento * largura);
      result_2 = precoChapa / result_1;

      retornoQtdeMetrosQuad =
          "Quantidade em metro quadrados: ${result_1.toStringAsFixed(4)}";

      retornoPrecoPorMetro = r"Preco do metro quadrado R$: "
          "${result_2.toStringAsFixed(2)}";
    });
  }

  void calcularDivisorPecas() {
    setState(() {
      divisorComprimentoPeca = double.parse(divisorComprimento.text) / 1000;
      divisorLarguraPeca = double.parse(divisorLargura.text) / 1000;
      resultadoDivisorPeca = (divisorComprimentoPeca * divisorLarguraPeca);
      resultadoQtdeDePecaDivisor = (result_1 / resultadoDivisorPeca);
      resultadoValorPorPecas = (precoChapa / resultadoQtdeDePecaDivisor);
      retornoQtdeDePecas =
          "Quantidade de peças : ${resultadoQtdeDePecaDivisor.toStringAsFixed(4)} unidades";
      retornoCustoPorPeca = r"Custo por peça R$: "
          "${resultadoValorPorPecas.toStringAsFixed(2)}";
    });
  }

  void calcularOTotal() {
    setState(() {
      porcentagem = double.parse(valorPorcentagem.text);
      valorQtdePorcentagem =
          double.parse(valorQuantidadePorcentagemController.text);
      valorAdicional = double.parse(valorAdicionalController.text);

      resultadoDaPorcentagem = (resultadoValorPorPecas +
          ((porcentagem / 100) * resultadoValorPorPecas));
      retornoDaPorcetagem = r"Valor da porcentagem é : R$"
          "${resultadoDaPorcentagem.toString().substring(0, 4)}";

      finalQtdeValorAdicional =
          ((valorQtdePorcentagem * resultadoDaPorcentagem) + valorAdicional);

      valorTotal = r'Valor total é : R$'
          '${finalQtdeValorAdicional.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    var precoDaChapaController = MoneyMaskedTextController(
        leftSymbol: 'R\$ ',
        decimalSeparator: ',',
        thousandSeparator: '.',
        initialValue: precoChapa);

    precoDaChapaController.afterChange = (String masked, double raw) {
      precoChapa = raw;
    };

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Calculo de chapa',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: resetaCampos,
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: ((context, constraints) {
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: constraints.maxWidth * .5,
                      child: Center(
                        child: Text(
                          "Valor da chapa em Reais: ",
                        ),
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth * .5,
                      child: TextFormField(
                        controller: precoDaChapaController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Divider(),
                Text(
                  'Tamanho total da chapa',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: constraints.maxWidth * .5,
                      child: Center(
                        child: Text(
                          "Comprimento (mm):",
                        ),
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth * .5,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: medidasComprimento,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: constraints.maxWidth * .5,
                      child: Center(
                        child: Text(
                          "Largura (mm):",
                        ),
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth * .5,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: medidasLargura,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  retornoQtdeMetrosQuad,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  retornoPrecoPorMetro,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: calcularMedidas,
                  child: Text('Calcular as medidas'),
                  /*  onPressed: () {
                    if (precoChapa == null || precoDaChapa.text.isEmpty) {
                      if (comprimento == 0 ||
                          comprimento == 0.00 ||
                          comprimento == 0.0) {
                        if (largura == 0) {
                          print('laargura vazio');
                        }
                        print('comprimento vazio');
                      }
                      print('valor da chapa vazio');
                    } else {
                      calcularMedidas;
                    }
                  }, */
                ),
                Divider(),
                Text(
                  'Divisor de peças',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: constraints.maxWidth * .5,
                      child: Center(
                        child: Text(
                          "Comprimento (mm):",
                        ),
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth * .5,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: divisorComprimento,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: constraints.maxWidth * .5,
                      child: Center(
                        child: Text(
                          "Largura (mm):",
                        ),
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth * .5,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: divisorLargura,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  retornoQtdeDePecas,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  retornoCustoPorPeca,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: calcularDivisorPecas,
                  child: Text('Calcular a divisão das peças'),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                Text(
                  'Calcular porcentagem de ganho',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: constraints.maxWidth * .5,
                      child: Center(
                        child: Text(
                          "Por porcentagem (%):",
                        ),
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth * .5,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: valorPorcentagem,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  retornoDaPorcetagem,
                ),
                Row(
                  children: [
                    Container(
                      width: constraints.maxWidth * .5,
                      child: Center(
                        child: Text(
                          "Por quantidade:",
                        ),
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth * .5,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: valorQuantidadePorcentagemController,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: constraints.maxWidth * .5,
                      child: Center(
                        child: Text(
                          r"Adicional: R$",
                        ),
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth * .5,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: valorAdicionalController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: calcularOTotal,
                  child: Text('Calcular o total'),
                  /* onPressed: () {
                    calcularOTotal;
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text('Simple Dialog'),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('${calcularOTotal.}'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('Fechar Dialog'),
                            ),
                          ],
                        );
                      },
                    );
                  }, */
                ),
                Text(
                  'Valor total é a soma: \n(Porcentagem + quantidade + adicional)',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  valorTotal,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
