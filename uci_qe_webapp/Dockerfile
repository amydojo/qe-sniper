#--- multi-service image ---
FROM rocker/verse:4.4.0

# install system libs
RUN apt-get update && apt-get install -y curl git &&     R -e "install.packages(c('plumber','geepack','lme4','QIC','mice','broom.mixed'))" &&     curl -L https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.550/quarto-1.4.550-linux-amd64.deb -o /tmp/quarto.deb &&     apt-get install -y /tmp/quarto.deb

# copy repo
WORKDIR /app
COPY . /app

EXPOSE 8000 3000
CMD ["bash","start.sh"]
