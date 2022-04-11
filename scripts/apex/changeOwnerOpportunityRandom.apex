List<User> users = [SELECT Id FROM User WHERE alias IN ('aoconnor', 'twolf', 'mwilliam', 'amiller')];
List<Opportunity> oppties = [SELECT Id, OwnerId, Account.OwnerId FROM Opportunity];

Integer i = 0;
Integer randomNumber;
Integer OneToFour;

for (Opportunity oppty : oppties) {
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
    oppty.OwnerId = users[OneToFour].Id;
    i = i + 1;
}
update oppties;