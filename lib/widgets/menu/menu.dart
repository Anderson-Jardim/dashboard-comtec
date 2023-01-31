
import 'package:dashboard_comtec/widgets/vendas_geral/mapa.dart';
import 'package:dashboard_comtec/widgets/vendas_geral/vendas_geral.dart';
import 'package:dashboard_comtec/widgets/vendas_vendedor/venda_por_vendedor.dart';
import 'package:dashboard_comtec/widgets/vendas_vendedor/meta_vendas.dart';
import 'package:flutter/material.dart';

import '../dashboard/dashboard.dart';
import '../vendas_cidades/vendas_cidades.dart';



class Menu extends StatefulWidget {
  const Menu({super.key,});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _index = 0;

  _switcherBody() {
    switch (_index) {
      case 0:
        return const Dashboard();

      case 1:
        return const VendasGeral();
        
      case 2:
        return const Vendas_cidades();

      case 3:
        return  const Mapa();

      case 4:
        return const VendaPorVendedor();
      
      case 5:
        return const Meta_vendas();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _switcherBody(),
      appBar: AppBar(
        title: const Text('COMTEC APP'),
        backgroundColor: Colors.deepPurple
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            ListTile(
              title: const Text(
                'Dashboard',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              onTap: () {
                setState(() {
                  _index = 0;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 1,
              color: Colors.black,
            ),
            ListTile(
              title: const Text(
                'Vendas Gerais',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              onTap: () {
                setState(() {
                  _index = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 1,
              color: Colors.black,
            ),
            ListTile(
              title: const Text(
                'Vendas Por Cidade',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              onTap: () {
                setState(() {
                  _index = 2;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 1,
              color: Colors.black,
            ),
            ListTile(
              title: const Text(
                'Mapa Vendas',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              onTap: () {
                setState(() {
                  _index = 3;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 1,
              color: Colors.black,
            ),
            ListTile(
              title: const Text(
                'Vendas Por Vendedor',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              onTap: () {
                setState(() {
                  _index = 4;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 1,
              color: Colors.black,
            ),
            ListTile(
              title: const Text(
                'Meta Vendedor',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              onTap: () {
                setState(() {
                  _index = 5;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
