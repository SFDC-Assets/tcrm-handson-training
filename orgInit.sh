sfdx shane:org:create -f config/project-scratch-def.json -d 10 -s --userprefix einstein -o discovery.demo
sfdx force:source:push


#sfdx force:user:permset:assign -n TC_22_CRMA_Workshop
sfdx shane:user:password:set -p salesforce1 -g User -l User


sfdx force:apex:execute -f scripts/apex/createUser.apex
sfdx automig:load  --inputdir ./data/core
sfdx force:apex:execute -f scripts/apex/changeOwnerAccount_Random.apex
sfdx force:apex:execute -f scripts/apex/changeOwnerOpportunityRandom.apex
sfdx force:apex:execute -f scripts/apex/changeOwnerEvent_Random.apex
sfdx force:apex:execute -f scripts/apex/changeOwnerCase_Random.apex

sfdx shane:analytics:dataset:upload -f data/churnmodern2020.csv -m data/churnmodern2020.json -n TelcoChurn -a Share_Predictions_with_EDiT --async
sfdx shane:analytics:dataset:upload -f data/Account_Churn.csv -m data/Account_Churn.json -n 'Account_Churn' -a Build_a_Model_with_ED --async


sfdx analytics:app:create -f analytics/CustomerInsights_template_Values.json --wait 60



sfdx force:org:open