PermissionSet workshopPerm = [SELECT Id FROM PermissionSet WHERE Name = 'TC_22_CRMA_Workshop' LIMIT 1];
User user1 = [SELECT Id FROM User WHERE alias = 'aoconnor' LIMIT 1];
User user2 = [SELECT Id FROM User WHERE alias = 'twolf' LIMIT 1];
User user3 = [SELECT Id FROM User WHERE alias = 'mwilliam' LIMIT 1];
User user4 = [SELECT Id FROM User WHERE alias = 'amiller' LIMIT 1];

PermissionSetAssignment psa1 = new PermissionSetAssignment (PermissionSetId = workshopPerm.Id, AssigneeId = user1.Id);
insert psa1;
PermissionSetAssignment psa2 = new PermissionSetAssignment (PermissionSetId = workshopPerm.Id, AssigneeId = user2.Id);
insert psa2;
PermissionSetAssignment psa3 = new PermissionSetAssignment (PermissionSetId = workshopPerm.Id, AssigneeId = user3.Id);
insert psa3;
PermissionSetAssignment psa4 = new PermissionSetAssignment (PermissionSetId = workshopPerm.Id, AssigneeId = user4.Id);
insert psa4;
