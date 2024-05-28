import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project_if22b/config/assets.dart';
import 'package:project_if22b/event/event_db.dart';
import 'package:project_if22b/model/mahasiswa.dart';
import 'package:project_if22b/screen/admin/add_update_mahasiswa.dart';

class ListMahasiswa extends StatefulWidget {
  const ListMahasiswa({super.key});

  @override
  State<ListMahasiswa> createState() => _ListMahasiswaState();
}

class _ListMahasiswaState extends State<ListMahasiswa> {
  List<Mahasiswa> _listMahasiswa = [];

  void getMahasiswa() async {
    _listMahasiswa = await EventDb.getMahasiswa();

    setState(() {});
  }

  @override
  // fungsi yang akan di jalankan pertama kali ketika program gijalankan
  void initState() {
    getMahasiswa();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Mahasiswa"),
        backgroundColor: Asset.colorPrimary,
      ),
      body: Stack(
        children: [
          _listMahasiswa.length > 0
              ? ListView.builder(
                  itemCount: _listMahasiswa.length,
                  itemBuilder: (context, index) {
                    Mahasiswa mahasiswa = _listMahasiswa[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                        backgroundColor: Colors.white,
                      ),
                      title: Text(mahasiswa.nama ?? ''),
                      subtitle: Text(mahasiswa.npm ?? ''),
                      trailing: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                    );
                  },
                )
              : Center(
                  child: Text("Data Kosong"),
                ),
          Positioned(
            child: FloatingActionButton(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Asset.colorPrimaryDark,
              onPressed: () {
                Get.to(AddUpdateMahasiswa())?.then((value) => getMahasiswa());
              },
            ),
            bottom: 16,
            right: 16,
          ),
        ],
      ),
    );
  }
}
