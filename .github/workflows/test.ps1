$output = "ahoj1"
Write-Output $output | Out-File -Encoding UTF8 "s3://mlprepare/file.txt"
