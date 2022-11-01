import 'package:cervejaiadaappflutter/model/via_cep_model.dart';
import 'package:cervejaiadaappflutter/repositories/cep/via_cep_repository.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CepFind extends StatefulWidget {
  const CepFind({Key? key}) : super(key: key);

  @override
  createState() => _CepFindState();
}

class _CepFindState extends State<CepFind> {
  var cepController = TextEditingController(text: "");
  bool loading = false;
  var viacepModel = ViaCEPModel();
  var viaCEPRepository = ViaCepRepository();

  var cepFormatter = MaskTextInputFormatter(
    mask: '#####-###', 
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const Text("CEP Find", style: TextStyle(fontSize: 22)),
            TextField(
              inputFormatters: [cepFormatter],
              controller: cepController,
              keyboardType: TextInputType.number,
              onChanged: (String value) async {
                viacepModel = await viaCEPRepository.consultarCEP(cepFormatter.getUnmaskedText());
                setState(() {
                  loading = false;
                });
              },
            ),
            const SizedBox(height: 50),
            Text(viacepModel.logradouro ?? "", style: const TextStyle(fontSize: 22)),
            Text(
              "${viacepModel.localidade ?? ""} - ${viacepModel.uf ?? ""}",
              style: const TextStyle(fontSize: 22),
            ),
            if (loading) const CircularProgressIndicator()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {},
      ),
    ));
  }

}
