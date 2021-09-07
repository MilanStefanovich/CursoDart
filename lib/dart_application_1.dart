import 'package:dart_application_1/clases/pais.dart';
import 'package:http/http.dart' as http;

//import 'clases/reqres_respuesta.dart';

import 'package:dart_application_1/clases/reqres_respuesta.dart';

void getReqResp_service() {
  final url = Uri.parse('https://reqres.in/api/users?page=2');
  http.get(url).then((res) {
    //print(res);

    //final body = jsonDecode(res.body);
    final resResqRes = reqResRespuestaFromJson(res.body);

    //print(body);

    //print('page: ${body['page']}');
    //print('per_page: ${body['per_page']} ');
    //print('id del tercer elemento: ${body['data'][2]['id']}');

    print('page: ${resResqRes.page}');
    print('per_page: ${resResqRes.perPage} ');
    print('id del tercer elemento: ${resResqRes.data[2].id}');
  });
}

void getPais() {
  final url = Uri.parse('https://restcountries.eu/rest/v2/alpha/col');
  http.get(url).then((res) {
    final pais = paisFromJson(res.body);
    print('====================================');
    print('pais: ${pais.name}');
    print('poblacion: ${pais.population}');
    print('Fronteras:');
    pais.borders.forEach((f) => print(f));
    print('lenguaje: ${pais.languages[0].nativeName}');
    print('latitud: ${pais.latlng[0]}');
    print('longitud: ${pais.latlng[1]}');
    print('moneda: ${pais.currencies[0].name}');
    print('bandera: ${pais.flag}');
    print('====================================');
  });
}
