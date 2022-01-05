sfdx shane:org:create -f config/project-scratch-def.json -d 1 -s --userprefix einstein -o discovery.demo

sfdx shane:analytics:dataset:upload -f data/AcquiredAccount.csv -m data/AcquiredAccount.json -n AcquiredAccount -a SharedApp --async
sfdx shane:analytics:dataset:upload -f data/deliveries.csv -m data/deliveries.json -n deliveries -a SharedApp --async
sfdx shane:analytics:dataset:upload -f data/testdrives.csv -m data/testdrives.json -n testdrives -a SharedApp --async
sfdx shane:analytics:dataset:upload -f data/csat.csv -m data/csat.json -n csat -a SharedApp --async

sfdx force:source:push
sfdx shane:user:password:set -p salesforce1 -g User -l User
sfdx force:org:open -p /analytics/home
