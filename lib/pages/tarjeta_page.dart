import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_stripe_app/models/tarjeta_credito.dart';
import 'package:flutter_stripe_app/widgets/total_pay_button.dart';

class TarjetaPage extends StatelessWidget {
  const TarjetaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tarjeta = TarjetaCredito(
        cardNumberHidden: '4242',
        cardNumber: '4242424242424242',
        brand: 'visa',
        cvv: '213',
        expiracyDate: '01/25',
        cardHolderName: 'Fernando Herrera');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagar'),
        ),
        body: Stack(
          children: [
            Container(),
            Hero(
              tag: tarjeta.cardNumber,
              child: CreditCardWidget(
                cardNumber: tarjeta.cardNumberHidden,
                expiryDate: tarjeta.expiracyDate,
                cardHolderName: tarjeta.cardHolderName,
                isHolderNameVisible: true, //** Esto no se requería antes */
                cvvCode: tarjeta.cvv,
                showBackView: false,
                onCreditCardWidgetChange:
                    (p0) {}, //** Esto se hizo obligatorio */
              ),
            ),
            const Positioned(bottom: 0, child: TotalPayButton()),
          ],
        ));
  }
}
