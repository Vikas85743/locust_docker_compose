$status = 0
do
{
    #invoke the swarm from api call
    try {
        $Url = "http://localhost:8089/swarm"
        $Body = @{
            user_count = 1
            spawn_rate = 1.0
            host = "https://jsonplaceholder.typicode.com"
           }
         $status = Invoke-RestMethod -Method 'Post' -Uri $url -Body $body
         Write-Host $status.message
        }
    
    catch {
        Write-Host $_.Exception.Message
        $output = $_.Exception.Message
       Write-Host $output.count
    }

}while($status.message -ne "Swarming started")