import 'package:flutter/material.dart';

class OptionsModal extends StatefulWidget {
  final Function(String) onDelete;
  final String id;
  final String title;
  final double value;

  OptionsModal(this.onDelete, this.id, this.title, this.value);

  @override
  _OptionsModalState createState() => _OptionsModalState();
}

class _OptionsModalState extends State<OptionsModal> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            FlatButton(
              onPressed: () {},
              child: Text('Editar'),
            ),
            FlatButton(
              onPressed: () => widget.onDelete(widget.id),
              child: Text('Excluir'),
            ),
          ],
        ),
      ),
    );
  }
}
