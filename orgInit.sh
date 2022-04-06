sfdx shane:org:create -f config/project-scratch-def.json -d 1 -s --userprefix einstein -o discovery.demo
sfdx force:source:push

#sfdx force:user:permset:assign -n TC_22_CRMA_Workshop
sfdx force:apex:execute -f scripts/apex/createUser.apex
sfdx automig:load  --inputdir ./dv4
sfdx force:apex:execute -f scripts/apex/changeOwnerAccount.apex
sfdx force:apex:execute -f scripts/apex/changeOwnerOpportunity.apex
sfdx force:apex:execute -f scripts/apex/changeOwnerEvent.apex

sfdx shane:analytics:dataset:upload -f data/churnmodern2020.csv -m data/churnmodern2020.json -n TelcoChurn -a SharedApp --async
sfdx shane:analytics:dataset:upload -f data/churn.csv -m data/churn.json -n churn -a SharedApp --async

#This next block is only if we cannot use the automig plugin
#sfdx force:data:bulk:upsert -s UserRole -f data/core/UserRole.csv -i Name -w 2
#sfdx force:data:bulk:upsert -s ,User -f sfdx_temp/User_Load.csv -i External_Id__c -w 2
#sfdx force:data:bulk:upsert -s Account -f data/core/Account.csv -i External_Id__c -w 5
#sfdx force:data:bulk:upsert -s Opportunity -f data/core/Opportunity.csv -i External_Id__c -w 5
#sfdx force:data:bulk:upsert -s Task -f data/core/Task.csv -i External_Id__c -w 5
#sfdx force:data:bulk:upsert -s Event -f data/core/Event.csv -i External_Id__c -w 5
#sfdx force:data:bulk:upsert -s Case -f data/core/Case.csv -i External_Id__c -w 5

sfdx analytics:app:create -f analytics/CustomerInsights_template_Values.json --wait 60

sfdx shane:user:password:set -p salesforce1 -g User -l User

sfdx force:org:open 