$output = "ahoj"
Write-Output $output | Out-File -Encoding UTF8 "s3://mlprepare/PS/file.txt"
