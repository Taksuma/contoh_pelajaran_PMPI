import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/bloc/table_resto/get_table_resto_bloc.dart';
import 'package:project_flutter/ui/add_table_resto_page.dart';

class TableRestoPage extends StatelessWidget {
  const TableRestoPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Table Resto')),
      body: BlocBuilder<GetTableRestoBloc, GetTableRestoState>(
        builder: (context, state) {
          return switch (state) {
          // TODO: Handle this case.
            GetTableRestoInitial() || GetTableRestoLoading() => Center(
              child: CircularProgressIndicator(),
            ),
          // TODO: Handle this case.
            GetTableRestoLoaded(listTableResto: var data) when data.isNotEmpty => ListView.builder(
              itemCount: state.listTableResto.length,
              itemBuilder: (_, index) => ListTile(
                title: Text(state.listTableResto[index].name.toString()),
              ),
            ),
          // TODO: Handle this case.
            GetTableRestoError() => Center(child: Text(state.message)),

            GetTableRestoLoaded() => Center(child: Text('Data masih kosong...'),)
          };
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTableRestoPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
