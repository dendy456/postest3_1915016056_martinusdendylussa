import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Gender { Cowo, Cewe, Unknown }

class _MyHomePageState extends State<MyHomePage> {
  bool setuju = false;
  String pembeli = "", alamat = "", noHp = "";
  final pembeliCtrl = TextEditingController();
  final alamatCtrl = TextEditingController();
  final noHpCtrl = TextEditingController();
  Gender gender = Gender.Unknown;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pembeliCtrl.dispose();
    alamatCtrl.dispose();
    noHpCtrl.dispose();
    super.dispose();
  }

  String getGender(Gender? value) {
    if (value == Gender.Cowo) {
      return "Laki-Laki";
    } else if (value == Gender.Cewe) {
      return "Perempuan";
    }
    return "Tidak Bergender";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KAIL STORE"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(0, 103, 120, 50),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/font2.png'))),
                ),
                Text(
                    'Silahkan untuk mengisi data sebelum melakukan pembelian '),
                Text('di toko ini...'),
                const SizedBox(height: 20),
                TextField(
                  controller: pembeliCtrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nama Pembeli",
                    hintText: 'Isi Nama Anda',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: alamatCtrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Alamat",
                    hintText: 'Isi Alamat Anda',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: noHpCtrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nomor Hp",
                    hintText: 'Cth. 0813xxxxxxxx',
                  ),
                ),
                const SizedBox(height: 30),
                ListTile(
                  title: const Text("Laki-Laki"),
                  leading: Radio(
                    groupValue: gender,
                    value: Gender.Cowo,
                    // Tanda ? pada akhir tipe data menandakan nullable.
                    // Flutter by design tidak memperbolehkan variable kosong.
                    // Contoh:
                    // String nama; <- Error
                    // String? nama; <- Tidak error;
                    onChanged: (Gender? value) {
                      setState(() {
                        // Di beri tanda seru karena variable gender bertipe Gender
                        // sedangkan value bertipe Gender? jadinya bentrok.
                        // Solusinya ditambah tanda ! diakhir variable yang bertipe Gender?
                        // Jika kalian tidak percaya, cukup hapus tanda seru di bawah,
                        // lalu QuickFix nilai value.
                        gender = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text("Perempuan"),
                  leading: Radio(
                    groupValue: gender,
                    value: Gender.Cewe,
                    onChanged: (Gender? value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  title: const Text(
                      "Saya menyetujui syarat, ketentuan, dan privasi Toko"),
                  leading: Checkbox(
                    value: setuju,
                    onChanged: (bool? value) {
                      setState(() {
                        setuju = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  pembeli = pembeliCtrl.text;
                  alamat = alamatCtrl.text;
                  noHp = noHpCtrl.text;
                });
              },
              child: const Text("Konfirmasi"),
            ),
            const SizedBox(height: 100),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 10, bottom: 25),
              child: Text(
                'Nama Pembeli   : $pembeli',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 10, bottom: 25),
              child: Text(
                'Alamat                : $alamat',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 10, bottom: 25),
              child: Text(
                'No. Hp                : $noHp',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 10, bottom: 25),
              child: Text(
                'Gender               : ${getGender(gender)}',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 10, bottom: 25),
              child: Text(
                'Menyetujui         : ${setuju ? "Menyetujui" : "Tidak Menyetujui"}',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
