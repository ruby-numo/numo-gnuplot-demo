# Ruby/Numo::Gnuplot Demo

This repository contains demo script of
[Ruby/Numo::Gnuplot](https://github.com/ruby-numo/gnuplot)

## [Demo translated from Gnuplot demo](gnuplot)
### [Show images using Numo::NArray](misc/image)

## Numo::GSL demo
### [Bessel functions](gsl/bessel)
### [Random Number Generation](gsl/rng)

## [Conway's Game of Life](misc/lifegame)

## [Lorenz attractor](misc/lorenz)

## Quick Start
If you're familiar with Docker, the following commands should work in most cases:

```
docker pull rubynumo/gnuplot-demo
docker run -d -p 8888:8888 rubynumo/gnuplot-demo start-notebook.sh --NotebookApp.token=''
```

and open a web browser to http://localhost:8888 . Then you should see a folder named `notebooks`.
By running the cells in the notebook you can reproduce the plots in the following links.

Our Docker image is based on Minimal Jupyter Notebook Stack.
See https://github.com/jupyter/docker-stacks/tree/master/minimal-notebook for more details on the Docker command options.
