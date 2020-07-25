import 'package:credit_simulator/models/proposta/proposta_model.dart';
import 'package:credit_simulator/utils/routes_api/routes_api.dart';
import 'package:dio/dio.dart';

class PropostaData {
  Future<List<Proposta>> listarPropostas() async {
    final propostas = List<Proposta>();

    try {
      Response response = await Dio().get(
        RoutesApi.LISTAR_PROPOSTAS,
        options: Options(
          contentType: "application/json",
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
        ),
      );

      print(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        response.data.forEach((value) {
          propostas.add(Proposta.fromJson(value));
        });
      } else {
        // msgAlterarDadosPessoais = json.decode(response.data)['message'];

        print(response.data);
        print(response.statusMessage);
        print(response.statusCode);
      }
    } catch (error) {
      print(error);
    }
    return propostas;
  }

  Future<bool> gravarProposta(Proposta propostaData) async {
    try {
      Response response = await Dio().post(
        RoutesApi.CRIAR_PROPOSTA,
        data: propostaData.toJson(),
        options: Options(
          contentType: "application/json",
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
        ),
      );

      print(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        // msgAlterarDadosPessoais = json.decode(response.data)['message'];

        print(response.data);
        print(response.statusMessage);
        print(response.statusCode);
      }
    } catch (error) {
      print(error);
    }
    return false;
  }
}
