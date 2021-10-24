
# Set default parameter set
[cmdletbinding(DefaultParameterSetName='container')]

# Intialize parameters
param (
		
	[Parameter(ParameterSetName='container')]
	[string]$name = 'grafana',
  [string]$cID = $(docker ps -qf "name=$name")
)


    # Check that container is running
    if($cID){
        Write-Output "The container $name is already running with ID: $cID"
    }
    else {
        Write-Output "Starting container $name...";
        docker volume create grafana-storage
        docker run -d -p 3000:3000 --name=grafana -v grafana-storage:/var/lib/grafana grafana/grafana-oss
    }
    
