List<Opportunity> oppties = [SELECT Id, OwnerId, Account.OwnerId FROM Opportunity];

for (Opportunity oppty : oppties) {
    oppty.OwnerId = oppty.Account.OwnerId;
}

update oppties;