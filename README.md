# restful-web-services

docker build . --tag demo

docker run -d --name "restful-web-services" --restart=always -p 8080:8080 demo:latest
