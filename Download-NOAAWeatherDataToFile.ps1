Start-Transcript ".\outputlog.txt"
$webRequestResponse = Invoke-WebRequest -Uri "https://w1.weather.gov/xml/current_obs/KMSP.xml" -ErrorAction Continue -Verbose
$weatherText = ((Out-String -InputObject ([XML]$webRequestResponse.Content).current_observation) -replace " ", "") -replace "observation_time_rfc822:", "timestamp:"
Out-File ".\weather_data.txt" -Encoding ascii -Force -InputObject $weatherText -ErrorAction Continue -Verbose
Stop-Transcript