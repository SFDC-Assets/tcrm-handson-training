List<User> users = [SELECT Id FROM User WHERE alias IN ('aoconnor', 'twolf', 'mwilliam', 'amiller')];
List<Account> accts = [SELECT Id, Name, OwnerId FROM Account];
Integer i = 0;
Integer randomNumber;
Integer OneToFour;

for (Account acct : accts) {
    randomNumber = Integer.valueof((Math.random())*10);
    if (randomNumber < 3) {
    OneToFour = 1;
} else if (randomNumber <6) {
    OneToFour = 2;
} else if (randomNumber <7) {
    OneToFour = 3;
} else {
    OneToFour = 0;
}
    acct.OwnerId = users[OneToFour].Id;
    i = i + 1;
}
update accts;