import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'options.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  _modalOptions(
    BuildContext context,
    Function(String) onRemove,
    String id,
    String title,
    double value,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return OptionsModal(onRemove, id, title, value);
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        final tr = transactions[index];
        return Card(
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 5,
          ),
          elevation: 5,
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: FittedBox(
                  child: Text('R\$${tr.value.toStringAsFixed(2)}'),
                ),
              ),
            ),
            title: Text(
              tr.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              DateFormat('d MMM y').format(tr.date),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (MediaQuery.of(context).size.width > 480)
                  FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    label: Text('Editar'),
                  ),
                if (MediaQuery.of(context).size.width > 480)
                  FlatButton.icon(
                    onPressed: () => onRemove(tr.id),
                    icon: Icon(Icons.delete),
                    label: Text('Excluir'),
                    textColor: Theme.of(context).errorColor,
                  ),
                if (MediaQuery.of(context).size.width < 480)
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () => _modalOptions(
                        context, onRemove, tr.id, tr.title, tr.value),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
