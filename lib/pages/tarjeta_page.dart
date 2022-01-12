import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_stripe_app/blocs/pagar/pagar_bloc.dart';
import 'package:flutter_stripe_app/widgets/total_pay_button.dart';

class TarjetaPage extends StatelessWidget {
  const TarjetaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pagarBloc = BlocProvider.of<PagarBloc>(context);
    final tarjeta = pagarBloc.state.tarjeta;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagar'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              pagarBloc.add(OnDesactivarTarjeta());
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
            Container(),
            Hero(
              tag: tarjeta!.cardNumber,
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
            const Positioned(
              bottom: 0,
              child: TotalPayButton(),
            ),
          ],
        ));
  }
}
