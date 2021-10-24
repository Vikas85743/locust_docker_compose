# create a persistent volume for your data in /var/lib/grafana (database and plugins)
docker volume create grafana-storage

# start grafana
docker run -d -p 3000:3000 --name=grafana -v grafana-storage:/var/lib/grafana grafana/grafana-oss
