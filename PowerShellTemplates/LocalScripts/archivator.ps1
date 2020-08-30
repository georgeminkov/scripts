[string] $opFolder="" # directory to archive
[string] $fileType=".js" # file type to archive

Get-ChildItem $opFolder | ForEach-Object { 
    if (($_.Extension) -eq $filetype){ 
        $everyDate=$_.LastWriteTime.ToString("yyyy-MM-dd")
        $tempDir = $opFolder + "\" + "Archive" +  $everyDate    
        if (-not (Test-Path -LiteralPath $tempDir)) {
            try {
                New-Item -Path $tempDir -ItemType Directory -ErrorAction Stop | Out-Null 
            }
            catch {
                Write-Error -Message "Unable to create directory '$tempDir'. Error was: $_" -ErrorAction Stop
            }
            "Successfully created temp directory '$tempDir'!"
        }
    }
}
