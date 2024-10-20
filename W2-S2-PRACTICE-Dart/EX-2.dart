class BankAccount {
  final int accountId;
  final String accountOwner;
  double _balance;  

  BankAccount(this.accountId, this.accountOwner, this._balance);

  // method to return the balance
  double get balance => _balance;

  // method withdraw
  void withdraw (double amount) {
    if (amount > _balance) {
      throw Exception('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }

  // method credit
  void credit (double amount) {
    _balance += amount;
  }
}

class Bank {
  String bankName;

  Bank(this.bankName);
  // List to hold all bank accounts
  final List<BankAccount> _accounts = [];

  // method to create a new account
  BankAccount createAccount (int accountId, String accountOwner) {

    //check if the accound with the same id exists
    for (var account in _accounts) {
      if (account.accountId == accountId) {
        throw Exception('Account with ID $accountId already exists');
      }
    }
    BankAccount newAccount =  BankAccount(accountId, accountOwner, 0);
    _accounts.add(newAccount);
    print('Account created for $accountOwner with ID $accountId');
    return newAccount;
  }

  //print all bank accounts
  void printAccounts(){
    for (var account in _accounts){
      print('Account ID: ${account.accountId}, Account Holder: ${account.accountOwner}, Balance: ${account.balance}');
    }
  }
}
 
void main() {

  Bank myBank = Bank("CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print('Balance: ${ronanAccount.balance}'); // Balance: $0
  ronanAccount.credit(100);
  print('Balance: ${ronanAccount.balance}'); // Balance: $100
  ronanAccount.withdraw(50);
  print('Balance: ${ronanAccount.balance}'); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
