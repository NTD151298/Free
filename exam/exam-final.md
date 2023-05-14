1. Create a Deployment
    - name: `nginx-deployment`
    - replicas: `3`
    - image: `nginx:latest`

2. Create a Service to expose the created deployment:
    - name: `nginx-nodeport`
    - type: `NodePort`

3. Create file `nginx.conf` with the following content and create a ConfigMap name `nginx-conf` from it:
    ```bash
    worker_processes 1;
    events { worker_connections 1024; };
    http {
      server { 
        listen 80; 
        location / { 
          root /usr/share/nginx/html; 
          index index.html; 
        }
      }
    }
    ```

4. Create file `index.html` with the following content and create a ConfigMap name `nginx-index` from it:
    ```html
    <html><h1>Welcome to my Kubernetes nginx deployment!</h1></html>
    ```

5. Mount the ConfigMaps into the container in the Deployment `nginx-deployment` as a volume:
    - ConfigMap `nginx-conf` is mounted at the path `/etc/nginx/nginx.conf`.
    - ConfigMap `nginx-index` is mounted at the path `/usr/share/nginx/html/index.html`.

6. Create a StatefulSet:
    - name: `postgres-statefulset`
    - replicas: `3`
    - image: `postgres`
    - mountPath: `/var/lib/postgresql/data`
    - volumeClaimTemplate:
      - storage request: `1Gi`
      - storageClassName: `standard`
      - accessMode: `ReadWriteOnce`

7.  Create a Secret from file `secret.env`:
    - name: `postgres-secret`
    - secret.env:
      ```
      POSTGRES_USER=root
      POSTGRES_PASSWORD=toor_password
      ```

8.  Configure the StatefulSet to use the Secret `postgres-secret` as environment variables.

9.  Scale up the nginx-deployment to 5 replicas.

10. Update value of the key `index.html` from the ConfigMap `nginx-index` to the new value:
    - new value: `We have a new version released!`

11. Verify that the `nginx-nodeport` is accessible by using `curl` and save the result to `/tmp/nginx-result.log`

12.  Verify that the `postgres` pods are running and the database is accessible by connecting to the database from a client application and performing some queries.

Note: You may need to adjust the specifics of this exercise to fit your Kubernetes environment and setup.