# Ruby/Numo::Gnuplot Demo

This repository contains demo script of
[Ruby/Numo::Gnuplot](https://github.com/ruby-numo/gnuplot)

## Contents

* [Demo translated from Gnuplot demo](gnuplot)
   * [Show images using Numo::NArray](misc/image)

* [Numo::GSL](https://github.com/ruby-numo/gsl) demo
   * [Bessel functions](gsl/bessel)
   * [Random Number Generation](gsl/rng)

* [Conway's Game of Life](misc/lifegame)
* [Lorenz attractor](misc/lorenz)

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

## Link to Examples using Ruby/Numo::Gnuplot

* In Japanese
  * [株価チャートをRuby+Numo-gnuplotで作成する。 - Rubyでシストレ](https://thawing-taiga-21738.herokuapp.com/5)
  * [趣味の記録部屋 Ruby で Numo-Gnuplot を使って関数フィッティングしたい](http://conveniencedailylife.blog.fc2.com/blog-entry-105.html)
  * [Python vs Ruby 『ゼロから作るDeep Learning』 1章 sin関数とcos関数のグラフ - Qiita](http://qiita.com/niwasawa/items/6d9aba43f3cdba5ca725)
  * [各種パラメータ最適化手法の実装（SGD, Momentum, AdaGrad, Adam） - Tech Blog by Akanuma Hiroaki](http://blog.akanumahiroaki.com/entry/2017/04/21/090000)
  * [ニューラルネットワークの誤差逆伝播法による学習アルゴリズムの実装 - Tech Blog by Akanuma Hiroaki](http://blog.akanumahiroaki.com/entry/2017/04/15/160000)
  * [MF / 【Ruby】numo-gnuplotで遊ぶ](http://medfreak.info/?p=2492)
  * [MF / 落書き numo-gnuplot でCT画像を3Dにしてみる](http://medfreak.info/?p=2597)
