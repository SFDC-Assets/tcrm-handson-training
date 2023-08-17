sfdx shane:org:create -f config/project-scratch-def.json -d 30 -s --userprefix einstein -o AIMadeEasy.demo
sfdx force:source:push

sfdx shane:user:password:set -p salesforce1 -g User -l User
sfdx automig:load  --inputdir ./data/core
sfdx shane:analytics:dataset:upload -f data/churnmodern2020.csv -m data/churnmodern2020.json -n TelcoChurn -a Share_Predictions_with_EDiT --async
sfdx shane:analytics:dataset:upload -f data/Account_Churn.csv -m data/Account_Churn.json -n 'Account_Churn' -a Build_a_Model_with_ED --async


sfdx force:org:open --path lightning
