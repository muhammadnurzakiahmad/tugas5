import 'package:flutter/material.dart';
import 'package:project2/providers/berita_panel_provider.dart';
import 'package:provider/provider.dart';

class BeritaPanelView extends StatelessWidget {
  const BeritaPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BeritaPanelProvider>().muatdata();
    return Scaffold(
        appBar: AppBar(
          title: Text('Berita'),
        ),
        body: Consumer<BeritaPanelProvider>(
          builder: (context, prov, w) {
            return ListView(children: [
              for (final data in prov.data)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${data['title']}'),
                    Image.network(
                      data['image'] ?? '',
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/logo.png');
                      },
                    ),
                    Text('${data['descricption']}')
                  ],
                )
            ]);
          },
        ));
  }
}
