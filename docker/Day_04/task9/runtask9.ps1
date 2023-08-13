# Create volume a003
docker volume create a003
# Start the source container nginx01 moutn to a003
docker run -d --name nginx01 -v a003:/data nginx
# Copy data from source container to host
docker cp nginx01:/data D:\Devops_FPT_Foudations\docker\Fist_container_data
# Stop and remove the source container
docker stop nginx01
docker rm nginx01
# Remove volume a003
docker volume rm a003
# Create the destination containernginx02
docker run -d --name nginx02 nginx
# Copy data from host to destination container
docker cp D:\Devops_FPT_Foudations\docker\Fist_container_data nginx02:/data



