import 'package:flutter/services.dart';

import '../model/device.dart';
import 'package:flutter/material.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  final TextEditingController _amountController = TextEditingController();
  double _amountInDollars = 0.0;
  Device _selectedDevice = Device.euro;
  double _convertedAmount = 0.0;

  final DeviceConverterModel _deviceConverterModel = DeviceConverterModel();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _convertAmount() {
    setState(() {
      _convertedAmount = _deviceConverterModel.convertToDeviceCurrency(_amountInDollars, _selectedDevice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.money,
              size: 60,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Amount in dollars:"),
            const SizedBox(height: 10),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                prefix: const Text('\$ '),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter an amount in dollar',
                hintStyle: const TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
              onChanged: (value) {
                setState(() {
                  _amountInDollars = double.tryParse(value) ?? 0.0;
                });
              },
            ),

            const SizedBox(height: 30),
            const Text("Device:"),
            DropdownButton<Device>(
              value: _selectedDevice,
              isExpanded: true,
              items: Device.values.map((Device device) {
                return DropdownMenuItem<Device>(
                  value: device,
                  child: Text(device.deviceName), 
                );
              }).toList(),
              onChanged: (Device? newDevice) {
                setState(() {
                  _selectedDevice = newDevice ?? Device.euro;
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _convertAmount,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 30),
            const Text("Amount in selected device:"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(
                '${_convertedAmount.toStringAsFixed(2)} ${_selectedDevice.deviceName}',
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 252, 115, 47),
              Color.fromARGB(255, 201, 79, 17),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const DeviceConverter(),
      ),
    ),
  ));
}
