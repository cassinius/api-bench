!#/bin/bash
curl -X PUT --header 'accept: application/json' --data-binary @- --dump - http://localhost:8529/_db/retailer_api/_api/document/retailer?onlyget=true <<EOF
["455","456","457","458","459","460","461","462","463","464"]
EOF
["455","456","457","458","459","460","461","462","463","464","465","466","467","468","469","470","471","472","473","474","475","476","477","478","479","480","481","482","483","484","485","486","487","488","489","490","491","492","493","494","495","496","497","498","499","500","501","502","503","504","505","506","507","508","509","510","511","512","513","514","515","516","517","518","519","520","521","522","523","524","525","526","527","528","529","530","531","532","533","534","535","536","537","538","539","540","541","542","543","544","545","546","547","548","549","550","551","552","553","554"]
