import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/bloc/table_resto/create/add_table_resto_bloc.dart';
import 'package:project_flutter/bloc/table_resto/get_table_resto_bloc.dart';
import 'package:project_flutter/ui/table_resto_page.dart';
import 'package:project_flutter/bloc/table_resto/update/update_table_resto_bloc.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MultiBlocProvider digunakan untuk menyediakan BLoC ke seluruh widget tree
    // yang berada di bawahnya.
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetTableRestoBloc()..add(TableRestoFetched()),
        ),
        BlocProvider(
          create: (context) => AddTableRestoBloc(),
        ),
        BlocProvider(
          create: (context) => UpdateTableRestoBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Resto Table Management',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // Kita atur TableRestoPage sebagai halaman utama
        home: const TableRestoPage(),
      ),
    );
  }
}