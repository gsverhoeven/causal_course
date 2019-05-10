---
title: Designing an introductory course to Causal Inference
author: Gertjan Verhoeven
---

# Introduction
(Short intro) This is me learning causal inference (CI) by self-study together with colleagues using online resources.

(Longer intro)
A modern data scientist needs to become skilled in at least three topics (I left out visualization):

* (Bayesian) Statistical modeling
* Machine Learning
* Causal inference

For the first two topics, great introductory books exist that 

* focus on learning-by-doing and 
* are low on math and high on simulation / programming in R 
* are fun / well written

For Bayesian statistical modeling, we have the awesome textbook ["Statistical Rethinking" ](https://xcelab.net/rm/statistical-rethinking/) by Richard mcElreath.

For Machine Learning, we have the (free) book ["Introduction to Statistical Learning"](http://www-bcf.usc.edu/~gareth/ISL/) by James, Witten, Hastie & Tibshirani.

However, for Causal Inference, such a book does not exist yet AFAIK. Therefore, I tried to piece together a Causal Inference course based on the criteria mentioned above.

# Designing an introductory causal inference course

Explicit goal was to contrast/combine the causal graph (DAG) approach with what some call "Quasi-experimental designs", i.e. the econometric causal effects toolkit (Regression Discontinuity Design, matching, instrumental variables etc).

In the end, I decided to combine the two causal chapters from Gelman & Hill (2007) [(freely available on Gelman's website)](https://statmodeling.stat.columbia.edu/2007/12/08/causal_inferenc_2/) 
with the introductory chapter on Causal Graphical Models by Felix Elwert [(freely available on Elwert's website)](https://www.ssc.wisc.edu/~felwert/causality/).

The Gelman & Hill chapters already come with a set of exercises. 
However, for DAGs, i could not find a suitable set of exercises. 

So I created two R markdown notebooks with exercises in R, 
that make use of the [DAGitty tool](http://dagitty.net/) , created by Johannes Textor and freely available as R package. 

Some exercises are taken from [Causal inference in statistics: A Primer](http://bayes.cs.ucla.edu/PRIMER/) by Pearl, Glymour & Jewell. (I probably should own this book. So I just ordered it :))

All materials are available in a [GitHub repository](https://github.com/gsverhoeven/causal_course)


# Outline of the course

The course has four parts.

## General introduction
The course starts with the first causal chapter of Gelman & Hill's book,  "Causal inference using regression on the
treatment variable". This creates a first complete experience with identifying and estimating causal effects.
However, there are no causal diagrams, which is unfortunate.

## Identification of Causal effects using DAGs
Next we dive into causal identification using the causal diagram approach.
For this we use the chapter "Causal Graphical Models" by Felix Elwert.
Two R markdown Notebooks with exercises using Dagitty complete this part.

## Identification and estimation strategies
We then continue with the second causal chapter of Gelman & Hill "Causal inference using more advanced
models". This covers matching, regression discontinuity design, and instrumental variables.
This material is combined with a paper by Scheiner et al, that contains DAGs for these methods.
In our study group DAGs greatly facilitate discussion of the various designs in classroom settings.

## Varying treatment effects using Machine Learning
Finally, and this part of the course has yet to take place, is the topic of estimating heterogeneous (i.e. subgroup, or even individual) treatment effects. This covers recent developements based on (forests of) regression trees (Both bayesian (BART, Chipman & mcCullough) and non-bayesian (GRF, Athey & Wager).

# Looking back so far

The causal diagram / DAG approach is nonparametric and its purpose is to

* Make assumptions on the data generating process explicit
* Formalize identification of causal effects

Thus, it is separate from, and complements statistical estimation.
The distinction between identification and estimation is not so explicitly made in the Gelman & Hill chapters, at least this is my impression.
It would really benefit from adding DAGs, as Richard mcElreath is doing in his upcoming second edition of Statistical Rethinking.

After having worked through these materials, I think reading Shalizi's chapters on Causal Effects would be a smart move.
This is part III of his book ["Advanced Data Analysis from an Elementary Point of View"](https://www.stat.cmu.edu/~cshalizi/ADAfaEPoV/), which is awesome in its clarity, practical remarks a.k.a. normative statements by the author, and breadth.

If you have a question, would like to comment or share ideas feel free to [contact me](https://gsverhoeven.github.io/#contact).

