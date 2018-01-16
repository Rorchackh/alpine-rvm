# alpine-rvm
a small docker image based on Alpine used for containerizing older ruby 1.8.7 on Rails projects

# How to use

Create a Dockerfile in your project directory and add the following:

```
FROM rorchackh/alpine-rvm:<version>
```

Customize your image by copying the docker-compose.yml into your project and customizinggit the given parameters
