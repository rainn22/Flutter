enum Device { euro, riel, dong }

extension DeviceExtension on Device {
  double get conversionRate {
    switch (this) {
      case Device.euro:
        return 0.92;
      case Device.riel:
        return 4000.0;
      case Device.dong:
        return 23000.0; 
    }
  }
}

class DeviceConverterModel {
  double convertToDeviceCurrency(double amountInDollars, Device device) {
    return amountInDollars * device.conversionRate;
  }
}
