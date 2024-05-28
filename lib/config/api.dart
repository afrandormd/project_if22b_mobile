class Api {
  // route (root)
  static const _host = "http://192.168.160.144/api_if22b";

  // folder mahasiswa
  static String _mahasiswa = "$_host/mahasiswa";

  // mahasiswa
  static String getMahasiswa = "$_mahasiswa/view.php";
  static String addMahasiswa = "$_mahasiswa/add.php";
  static String updateMahasiswa = "$_mahasiswa/update.php";
  static String deleteMahasiswa = "$_mahasiswa/delete.php";
}
