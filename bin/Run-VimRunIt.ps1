function Find-FileUpwards {
    param (
        [string]$FileName
    )

    $CurrentDir = Get-Location
    while ($CurrentDir -ne [System.IO.Path]::GetPathRoot($CurrentDir)) {
        $FilePath = Join-Path $CurrentDir $FileName
        if (Test-Path $FilePath) {
            return $FilePath
        }
        $CurrentDir = Get-Item -Path $CurrentDir | Select-Object -ExpandProperty Parent
    }

    $RootFilePath = Join-Path $CurrentDir $FileName
    if (Test-Path $RootFilePath) {
        return $RootFilePath
    }

    return $null
}

function Run-VimRunIt {
	param (
		[Parameter(ValueFromRemainingArguments=$true)]
		$Args
	)
	$runItBatFilename = ".vim-runit-cmd.bat"
	$runItBatPath = Find-FileUpwards -FileName $runItBatFilename

	if (!$runItBatPath) {
		Write-Host "Failed to find $runItBatFilename"
	}

	& $runItBatPath $Args
}
