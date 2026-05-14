import 'package:flutter/material.dart';

class CicloStateful extends StatefulWidget {
  final Color cor;
  const CicloStateful({super.key, required this.cor});

  @override
  State<CicloStateful> createState() => _CicloStatefulState();
}

class _CicloStatefulState extends State<CicloStateful> {
  @override
  void initState() {
    super.initState();
    print('initState Widget foi inserido na árvore de widgets');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies: dependências do widget foram alteradas');
  }

  @override
  void didUpdateWidget(CicloStateful oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget: propriedades mudaram');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose: widget foi removido da árvore de widgets');
  }

  @override
  Widget build(BuildContext context) {
    print('build: widget está sendo construído / reconstruido');
    return Container(
      height: 200,
      width: 200,
      color: widget.cor,
      child: Center(
        child: Text(
          'Indicando cor atual',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
