enum Device { 
  euro('EURO'), 
  riel('RIEL'), 
  dong('DONG');

  final String deviceName;
  const Device (this.deviceName);
}

class DeviceConverterModel {
  double getConversionRate(Device device) {
    switch (device) {
      case Device.euro:
        return 0.92;  
      case Device.riel:
        return 4000.0;
      case Device.dong:
        return 23000.0;
      default:
        throw Exception('Unsupported device type');
    }
  }

  double convertToDeviceCurrency(double amountInDollars, Device device) {
    double conversionRate = getConversionRate(device);
    return amountInDollars * conversionRate;
  }
}
