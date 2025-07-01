import 'package:flutter/material.dart';

class AddTableRestoPage extends StatefulWidget {
  const AddTableRestoPage({super.key});

  @override
  State<AddTableRestoPage> createState() => _AddTableRestoPageState();
}

class _AddTableRestoPageState extends State<AddTableRestoPage> {
  final _formKey = GlobalKey<FormState>();
  final _kodeMejaController = TextEditingController();
  final _namaMejaController = TextEditingController();
  final _kapasitasMejaController = TextEditingController();
  @override
  void dispose() {
    _kodeMejaController.dispose();
    _namaMejaController.dispose();
    _kapasitasMejaController.dispose();
    super.dispose();
  }

  void _simpanData() {
    if (_formKey.currentState!.validate()) {
      final kode = _kodeMejaController.text;
      final nama = _namaMejaController.text;
      final kapasitas = int.tryParse(_kapasitasMejaController.text) ?? 0;

      // TODO: Integrasi dengan BLoC atau simpan ke database di sini

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Meja "$nama" berhasil disimpan')),
      );

      Navigator.pop(context, true); // Kembali ke halaman sebelumnya
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Table Resto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _kodeMejaController,
                decoration: const InputDecoration(labelText: 'Kode Meja'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              TextFormField(
                controller: _namaMejaController,
                decoration: const InputDecoration(labelText: 'Nama Meja'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              TextFormField(
                controller: _kapasitasMejaController,
                decoration: const InputDecoration(labelText: 'Kapasitas Meja'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Wajib diisi';
                  if (int.tryParse(value) == null) return 'Harus angka';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _simpanData,
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
