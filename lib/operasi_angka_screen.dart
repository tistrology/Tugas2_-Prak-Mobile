import 'package:flutter/material.dart';

class OperasiAngkaScreen extends StatefulWidget {
  @override
  _OperasiAngkaScreenState createState() => _OperasiAngkaScreenState();
}

class _OperasiAngkaScreenState extends State<OperasiAngkaScreen> {
  final TextEditingController _angkaPertamaController = TextEditingController();
  final TextEditingController _angkaKeduaController = TextEditingController();
  String _selectedOperation = 'Penjumlahan'; // Menyimpan operasi yang dipilih
  String _hasil = ''; // Variabel untuk menyimpan hasil operasi

  void _hitungHasil() {
    int angkaPertama = int.tryParse(_angkaPertamaController.text) ?? 0;
    int angkaKedua = int.tryParse(_angkaKeduaController.text) ?? 0;

    setState(() {
      if (_selectedOperation == 'Penjumlahan') {
        _hasil = (angkaPertama + angkaKedua).toString();
      } else if (_selectedOperation == 'Pengurangan') {
        _hasil = (angkaPertama - angkaKedua).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operasi Penjumlahan & Pengurangan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Input untuk angka pertama
            TextField(
              controller: _angkaPertamaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Angka Pertama',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Dropdown untuk memilih operasi
            DropdownButton<String>(
              value: _selectedOperation,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOperation = newValue!;
                });
              },
              items: <String>['Penjumlahan', 'Pengurangan']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            // Input untuk angka kedua
            TextField(
              controller: _angkaKeduaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Angka Kedua',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _hitungHasil,
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            // Menampilkan hasil
            Text(
              'Hasil: $_hasil',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
