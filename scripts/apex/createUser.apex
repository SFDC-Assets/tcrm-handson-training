String dateString = String.valueof(Datetime.now()).replace(' ','').replace(':','').replace('-','');
String profileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1].Id;

String centralRoleId = [SELECT Id FROM UserRole WHERE Name = 'Central Sales' LIMIT 1].Id;
String eastRoleId = [SELECT Id FROM UserRole WHERE Name = 'East Sales' LIMIT 1].Id;
String svpRoleId = [SELECT Id FROM UserRole WHERE Name = 'SVP Sales' LIMIT 1].Id;
String westRoleId = [SELECT Id FROM UserRole WHERE Name = 'West Sales' LIMIT 1].Id;

List<User> users = new List<User>();
User user1 = new User(
    Username = 'aoconnor' + dateString + '@example.com', UserRoleId = westRoleId,
    FirstName = 'Alexis', LastName = ' Oconnor', Email = 'aoconnor@example.com',
    Alias = 'aoconnor', CommunityNickname = 'n' + String.valueOf(DateTime.now()),
    TimeZoneSidKey = 'America/Los_Angeles', LocaleSidKey = 'en_US', EmailEncodingKey = 'UTF-8',
    ProfileId = profileId, LanguageLocaleKey = 'en_US', IsActive = True );

User user2 = new User(
    Username = 'twolf' + dateString + '@example.com', UserRoleId = svpRoleId,
    FirstName = 'Teresa', LastName = ' Wolf', Email = 'twolf@example.com',
    Alias = 'twolf', CommunityNickname = 't' + String.valueOf(DateTime.now()),
    TimeZoneSidKey = 'America/Los_Angeles', LocaleSidKey = 'en_US', EmailEncodingKey = 'UTF-8',
    ProfileId = profileId, LanguageLocaleKey = 'en_US', IsActive = True );

User user3 = new User(
    Username = 'mwilliam' + dateString + '@example.com', UserRoleId = eastRoleId,
    FirstName = 'Melissa', LastName = ' Williams', Email = 'mwilliam@example.com',
    Alias = 'mwilliam', CommunityNickname = 'm' + String.valueOf(DateTime.now()),
    TimeZoneSidKey = 'America/Los_Angeles', LocaleSidKey = 'en_US', EmailEncodingKey = 'UTF-8',
    ProfileId = profileId, LanguageLocaleKey = 'en_US', IsActive = True );

User user4 = new User(
    Username = 'amiller' + dateString + '@example.com', UserRoleId = centralRoleId,
    FirstName = 'Amanda', LastName = ' Miller', Email = 'amiller@example.com',
    Alias = 'amiller', CommunityNickname = 'a' + String.valueOf(DateTime.now()),
    TimeZoneSidKey = 'America/Los_Angeles', LocaleSidKey = 'en_US', EmailEncodingKey = 'UTF-8',
    ProfileId = profileId, LanguageLocaleKey = 'en_US', IsActive = True );

users.add(user1);
users.add(user2);
users.add(user3);
users.add(user4);
insert users;
