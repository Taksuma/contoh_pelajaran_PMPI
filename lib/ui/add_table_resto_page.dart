import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/bloc/table_resto/create/add_table_resto_bloc.dart';
import 'package:project_flutter/bloc/table_resto/get_table_resto_bloc.dart';
import 'package:project_flutter/models/param/table_resto_param.dart';

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

  // Fungsi untuk menyimpan data
  void _simpanData() {
    // Validasi form terlebih dahulu
    if (_formKey.currentState!.validate()) {
      // Buat objek parameter dari data form
      final param = TableRestoParam(
        code: _kodeMejaController.text,
        name: _namaMejaController.text,
        capacity: int.tryParse(_kapasitasMejaController.text) ?? 0,
      );
      // Kirim event AddTableRestoPressed ke BLoC dengan membawa data parameter
      context.read<AddTableRestoBloc>().add(AddTableRestoPressed(tableRestoParam: param));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Meja Baru')),
      // BlocListener untuk 'mendengarkan' state perubahan tanpa membangun ulang UI
      // Berguna untuk menampilkan dialog, snackbar, atau navigasi
      body: BlocListener<AddTableRestoBloc, AddTableRestoState>(
        listener: (context, state) {
          switch(state) {
            // Saat sukses, tampilkan snackbar, refresh daftar, dan kembali
            case AddTableRestoSuccess(:final tableRestoCreateResponse):
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(tableRestoCreateResponse.message)),
              );
              // Memicu BLoC untuk mengambil data terbaru
              context.read<GetTableRestoBloc>().add(TableRestoFetched());
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            
            // Saat error, tampilkan snackbar dengan pesan error
            case AddTableRestoError(:final message):
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            
            // State lainnya bisa di-handle di sini jika perlu
            default:
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _kodeMejaController,
                  decoration: const InputDecoration(labelText: 'Kode Meja', border: OutlineInputBorder()),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Wajib diisi' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _namaMejaController,
                  decoration: const InputDecoration(labelText: 'Nama Meja', border: OutlineInputBorder()),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Wajib diisi' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _kapasitasMejaController,
                  decoration: const InputDecoration(labelText: 'Kapasitas Meja', border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Wajib diisi';
                    if (int.tryParse(value) == null) return 'Harus berupa angka';
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                // Gunakan BlocBuilder hanya pada tombol untuk menampilkan loading
                BlocBuilder<AddTableRestoBloc, AddTableRestoState>(
                  builder: (context, state) {
                    // Jika state adalah loading, tampilkan CircularProgressIndicator
                    if (state is AddTableRestoLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    // Jika tidak, tampilkan tombol
                    return ElevatedButton(
                      onPressed: _simpanData,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                      ),
                      child: const Text('Simpan'),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}