import 'package:flutter/material.dart';
import 'package:currency_converter/models/CurrencyModel.dart';

// widget for selecting from and to currencies with animated swap button
class CurrencySelectorCard extends StatefulWidget {
  final String fromCurrency;
  final String toCurrency;
  final ValueChanged<String> onFromChanged;
  final ValueChanged<String> onToChanged;
  final VoidCallback onSwap;
  final VoidCallback onViewRates;

  const CurrencySelectorCard({
    super.key,
    required this.fromCurrency,
    required this.toCurrency,
    required this.onFromChanged,
    required this.onToChanged,
    required this.onSwap,
    required this.onViewRates,
  });

  @override
  State<CurrencySelectorCard> createState() => _CurrencySelectorCardState();
}

class _CurrencySelectorCardState extends State<CurrencySelectorCard> with SingleTickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _handleSwap() {
    _animController.forward(from: 0.0);
    widget.onSwap();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: widget.fromCurrency,
                    decoration: const InputDecoration(
                      labelText: 'From',
                      border: OutlineInputBorder(),
                    ),
                    items: CurrencyModel.topTenCurrencies.map((c) {
                      return DropdownMenuItem(
                        value: c.code,
                        child: Text('${c.flagEmoji} ${c.code}'),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) widget.onFromChanged(val);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                RotationTransition(
                  turns: Tween(begin: 0.0, end: 0.5).animate(
                    CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.swap_horiz, size: 32, color: Colors.indigo),
                    onPressed: _handleSwap,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: widget.toCurrency,
                    decoration: const InputDecoration(
                      labelText: 'To',
                      border: OutlineInputBorder(),
                    ),
                    items: CurrencyModel.topTenCurrencies.map((c) {
                      return DropdownMenuItem(
                        value: c.code,
                        child: Text('${c.flagEmoji} ${c.code}'),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) widget.onToChanged(val);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextButton.icon(
              onPressed: widget.onViewRates,
              icon: const Icon(Icons.table_chart_outlined, size: 18),
              label: Text('view all rates for ${widget.fromCurrency}..'),
              style: TextButton.styleFrom(foregroundColor: Colors.indigo),
            ),
          ],
        ),
      ),
    );
  }
}
