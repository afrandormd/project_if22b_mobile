import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:project_if22b/config/api.dart';
import 'package:project_if22b/model/mahasiswa.dart';

class EventDb {
  // Fungsi getMahasiswa
  static Future<List<Mahasiswa>> getMahasiswa() async {
    List<Mahasiswa> listMahasiswa = [];

    try {
      var response = await http.get(Uri.parse(Api.getMahasiswa));
      // print(response.statusCode);
      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var mahasiswa = responBody['mahasiswa'];

          mahasiswa.forEach((mahasiswa) {
            listMahasiswa.add(Mahasiswa.fromJson(mahasiswa));
          });
        }
      }
    } catch (e) {
      print(e);
    }
    return listMahasiswa;
  }

  // akhir fungsi getMahasiswa
  // Fungsi addMahasiswa
  static Future<String> AddMahasiswa(String npm, String nama, String alamat) async {
    String reason;
    try {
      var response = await http.post(Uri.parse(Api.addMahasiswa), body: {
        'text_npm': npm,
        'text_nama': nama,
        'text_alamat': alamat,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          reason = 'Add Mahasiswa Berhasil';
        } else {
          reason = responBody['reason'];
        }
      } else {
        reason = "Request Gagal";
      }
    } catch (e) {
      print(e);
      reason = e.toString();
    }
    return reason;
  }
  // akhir fungsi addMahasiswa
}
