Invoke-RestMethod -Uri "https://tenable.companyname.com/rest/analysis" `
-Method "POST" `
-Headers @{
"Accept"="application/json, text/javascript, */*; q=0.01"
  "X-Requested-With"="XMLHttpRequest"
  "User-Agent"="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36"
  "Origin"="https://tenable.companyname.com"
  "Sec-Fetch-Site"="same-origin"
  "Sec-Fetch-Mode"="cors"
  "Sec-Fetch-Dest"="empty"
  "Referer"="https://tenable.companyname.com/"
  "Accept-Encoding"="gzip, deflate, br"
  "Accept-Language"="en-US,en;q=0.9"
  "x-apikey"="accessKey=abcdec474b40488888554447777;secretKey=123sdac35gdfh456hdfgh562345gdr"
} `
-ContentType "application/json" `
-Body "{`"query`":{`"tags`":`"`",`"name`":`"_1595860724.2599_2_6_1`",`"description`":`"`",`"context`":`"dashboard`",`"status`":0,`"createdTime`":1595860724,`"modifiedTime`":1595860724,`"group`":{`"id`":0,`"name`":`"Administrator`"},`"groups`":[],`"type`":`"vuln`",`"tool`":`"listvuln`",`"sourceType`":`"cumulative`",`"startOffset`":0,`"endOffset`":50,`"filters`":[{`"id`":`"severity`",`"filterName`":`"severity`",`"operator`":`"=`",`"type`":`"vuln`",`"isPredefined`":true,`"value`":`"4,3,2,1`"}],`"vulnTool`":`"listvuln`"},`"sourceType`":`"cumulative`",`"columns`":[],`"type`":`"vuln`"}" > outfile1.txt



$vulnCount = Select-String -Path outfile1.txt -AllMatches -Pattern '(totalRecords=([0-9]+))' | %{ $_.Matches[0].Groups[2].Value }
$vulnDate = get-date -Format 'MM/dd/yyyy'
$vulnTimeline = "C:\temp\VulnTimeLine.csv"
$data = "$vulnDate,$vulnCount"
add-Content -Path $vulnTimeline -Value $data
