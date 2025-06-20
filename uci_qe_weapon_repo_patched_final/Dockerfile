FROM rocker/verse:4.4.0
RUN install2.r --error pacman geepack lme4 lmerTest nlme QIC mice targets tarchetypes     broom.mixed clubSandwich naniar ggResidpanel viridis
RUN wget -qO- https://quarto.org/download/latest/quarto-linux-amd64.deb > /tmp/q.deb &&     apt-get update && apt-get install -y /tmp/q.deb
WORKDIR /home/rstudio/project
