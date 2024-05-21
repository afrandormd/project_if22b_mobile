class Mahasiswa {
  String? npm;
  String? nama;
  String? alamat;

  Mahasiswa({
    this.npm,
    this.nama,
    this.alamat,
  });

  // untuk menangkap (menerima) api ketika mengembalikan data (menampilkan data)
  factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        npm: json['npm'],
        nama: json['nama'],
        alamat: json['alamat'],
      );

  // untuk mengirim data ke api
  Map<String, dynamic> toJson() => {
        'npm': this.npm,
        'nama': this.nama,
        'alamat': this.alamat,
      };
}
