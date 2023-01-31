import 'package:flutter/material.dart';

import '../vendas_geral/mapa.dart';
import '../vendas_geral/vendas_geral.dart';
import '../vendas_vendedor/meta_vendas.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 500,
              decoration: const BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const VendasGeral(),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 300,
              child: const Mapa(),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 300,
              child: const Meta_vendas(),
            ),
          ],
        ),
      ),
    );
  }
}
