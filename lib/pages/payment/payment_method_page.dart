import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//TODO: Добавьте платежные данные в базу данных и выберите способ оплаты из добавленных карт
class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Payment Method',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'E-Wallet',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          RadioListTile<String>(
                            title: const Text('E-Wallet Name'),
                            value: 'E-Wallet 1',
                            groupValue: _selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() {
                                _selectedPaymentMethod = value;
                              });
                            },
                            activeColor: Colors.blue,
                          ),
                          RadioListTile<String>(
                            title: const Text('E-Wallet Name'),
                            value: 'E-Wallet 2',
                            groupValue: _selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() {
                                _selectedPaymentMethod = value;
                              });
                            },
                            activeColor: Colors.blue,
                          ),
                          RadioListTile<String>(
                            title: const Text('E-Wallet Name'),
                            value: 'E-Wallet 3',
                            groupValue: _selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() {
                                _selectedPaymentMethod = value;
                              });
                            },
                            activeColor: Colors.blue,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Show More',
                              style: TextStyle(color: Colors.blue),
                            ))])),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Bank Transfer',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          RadioListTile<String>(
                            title: const Text('Bank Name'),
                            value: 'Bank 1',
                            groupValue: _selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() {
                                _selectedPaymentMethod = value;
                              });
                            },
                            activeColor: Colors.blue,
                          ),
                          RadioListTile<String>(
                            title: const Text('Bank Name'),
                            value: 'Bank 2',
                            groupValue: _selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() {
                                _selectedPaymentMethod = value;
                              });
                            },
                            activeColor: Colors.blue,
                          ),
                          RadioListTile<String>(
                            title: const Text('Bank Name'),
                            value: 'Bank 3',
                            groupValue: _selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() {
                                _selectedPaymentMethod = value;
                              });
                            },
                            activeColor: Colors.blue,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Show More',
                              style: TextStyle(color: Colors.blue),
                            ))]))]))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_selectedPaymentMethod != null) {
                          Navigator.pop(context, _selectedPaymentMethod);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('Choose',
                        style: TextStyle(color: Colors.white)),
                    ))]))])));
  }
}