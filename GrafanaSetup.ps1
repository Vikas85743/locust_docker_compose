
# Set default parameter set
[cmdletbinding(DefaultParameterSetName='container')]

# Intialize parameters
param (
		
	[Parameter(ParameterSetName='container')]
	[string]$name = 'grafana',
  [string]$cID1 = $(docker ps -a -qf "name=$name" -f "status=exited"),
  [string]$cID2 = $(docker ps -qf "name=$name")
)


    # Check that container is running
    if($cID1){
        Write-Output "The container $name is already exist with ID: $cID1"
        $(docker container start $cID1)       
    }
    elseif($cID2){
        Write-Output "The container $name is already running with ID: $cID2"       
    }
    else {
        Write-Output "Starting container 2 $name...";
        docker volume create grafana-storage
        docker run -d -p 3000:3000 --name=grafana -v grafana-storage:/var/lib/grafana grafana/grafana-oss
    }

    
