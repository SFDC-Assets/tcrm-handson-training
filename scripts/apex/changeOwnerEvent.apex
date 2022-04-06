List<Event> events = [SELECT Id, OwnerId, Account.OwnerId FROM Event];

for (Event evnt : events) {
    evnt.OwnerId = evnt.Account.OwnerId;
}

update events;