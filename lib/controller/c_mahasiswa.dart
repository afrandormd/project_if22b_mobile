import 'package:get/get.dart';
import 'package:project_if22b/model/mahasiswa.dart';

class CMahasiswa extends GetxController {
  Rx<Mahasiswa> _mahasiswa = Mahasiswa().obs;

  Mahasiswa get mahasiswa => _mahasiswa.value;

  void setMahasiswa(Mahasiswa dataMahasiswa) => _mahasiswa.value = dataMahasiswa;
}
