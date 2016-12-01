# Convert-PDF
Command used to transform pdf into string.


#Download 

Install-Module -Name Convert-PDF

Save-Module -Name Convert-PDF -Path  $env:TMP

#Example

[string]$temp=convertto-pdf -file c:\test.pdf
$temp= $temp -split "`n"
