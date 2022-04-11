List<User> users = [SELECT Id FROM User WHERE alias IN ('aoconnor', 'twolf', 'mwilliam', 'amiller')];
List<Account> accts = [SELECT Id, Name, OwnerId FROM Account];
Integer i = 0;

for (Account acct : accts) {
    acct.OwnerId = users[Math.mod(i,4)].Id;
    i = i + 1;
}

update accts;