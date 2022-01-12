import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_stripe_app/data/tarjetas.dart';
import 'package:flutter_stripe_app/helpers/helpers.dart';
import 'package:flutter_stripe_app/pages/tarjeta_page.dart';
import 'package:flutter_stripe_app/widgets/total_pay_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagar'),
        actions: [
          IconButton(
            onPressed: () async {
              // mostrarLoading(context);
              // await Future.delayed(const Duration(seconds: 1));
              // Navigator.pop(context);
              mostrarAlerta(context, 'titulo', 'mensaje');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            width: size.width,
            height: size.height,
            top: 200,
            child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.9,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: tarjetas.length,
                itemBuilder: (_, i) {
                  final tarjeta = tarjetas[i];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, navegarFadeIn(context, const TarjetaPage()));
                    },
                    child: Hero(
                      tag: tarjeta.cardNumberHidden,
                      child: CreditCardWidget(
                        cardNumber: tarjeta.cardNumberHidden,
                        expiryDate: tarjeta.expiracyDate,
                        cardHolderName: tarjeta.cardHolderName,
                        isHolderNameVisible: true,
                        cvvCode: tarjeta.cvv,
                        showBackView: false,
                        onCreditCardWidgetChange: (p0) {},
                      ),
                    ),
                  );
                }),
          ),
          const Positioned(
            child: TotalPayButton(),
            bottom: 0,
          ),
        ],
      ),
    );
  }
}
