enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final int zipCode;

  Address(this.street, this.city, this.zipCode);
}

class Employee {
  final String _name;
  final double _baseSalary;
  final Address _address;
  final int _yearOfExperience;
  final List<Skill> _skills;

  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearOfExperience);

  //named constructor
  Employee.mobileDeveloper(this._name, this._baseSalary, this._address, this._yearOfExperience): _skills = [Skill.FLUTTER, Skill.DART];
  Employee.webDeveloper(this._name, this._baseSalary, this._address, this._yearOfExperience): _skills = [Skill.OTHER];

  //getter 
  String get name => _name;
  double get baseSalary => _baseSalary;
  Address get address => _address;
  int get yearOfExperience => _yearOfExperience;
  List<Skill> get skills => _skills;

  //method to compute the salary of the employee
  double computeSalary(){
      double salary = 40000;
      salary += _yearOfExperience * 2000;

      //add skills bonus
      Map<Skill, double> skillBonus = {
        Skill.FLUTTER: 5000,
        Skill.DART: 3000,
        Skill.OTHER: 1000,
      };

      for (var skill in _skills){
        salary += skillBonus[skill] ?? 0;
      }

      return salary;
  }
  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary}, Total Salary: \$${computeSalary()}');
  }
}

void main() {

  final Address address = Address('2004', 'Phnom Penh', 12001);

  final emp1 = Employee('Sokea', 40000, [Skill.FLUTTER, Skill.OTHER], address, 4);
  emp1.printDetails();

  final emp2 = Employee.mobileDeveloper('Dara', 45000, address, 4);
  emp2.printDetails();

  var emp3 = Employee.mobileDeveloper('Lika', 50000, address, 3);
  emp3.printDetails();
}
