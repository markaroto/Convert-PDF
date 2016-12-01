<#
.SYNOPSIS
A set of functions for dealing with SSH connections from PowerShell, using the 
library found here on Itextsharp: http://itspdfservice.codeplex.com/


Copyright (c) 2016.
All rights reserved.
Author: Marcos Flavio Alves da Silva

.DESCRIPTION
See:
Get-Help Convertto-pdf

.EXAMPLE 
	$archive= Convertto-pdf -file D:\app\123.pdf
	$archive= $archive -split "`n"


#>
function convertto-pdf {
	param(
		[Parameter(Mandatory=$true)][string]$file
	)	
	Add-Type -Path "$PSScriptRoot\itextsharp.dll"
	$pdf = New-Object iTextSharp.text.pdf.pdfreader -ArgumentList $file
	for ($page = 1; $page -le $pdf.NumberOfPages; $page++){
		$texto=[iTextSharp.text.pdf.parser.PdfTextExtractor]::GetTextFromPage($pdf,$page)
		Write-Output $texto
	}	
	$pdf.Close()
}

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

Export-ModuleMember convertto-pdf