# Cognitive_Map_ML_Models

The aim of the project is to provide a computational framework for cognitive maps that
distinguishes between different aspects of cognitive maps (i.e., reference frame, scale, metric,
level of abstraction) without having to complicate the experimental design. This framework
will consist of computational models that are relatively easy to evaluate quantitatively. The
proposed model will be built on a existed one from general cognition literature (e.g., Generalized Context Model) 
and verified with a training procedure from real experimental data
using machine learning algorithms.

We use ML models that identify (classify) people according to the way they navigate in space. When someone navigates in space, let’s say going from point A to point B, some people put the reference point to themselves (they’re called egocentric RF) and others use an external reference point (allocentric).  From VR experiments we take measurements of their behavior (time to perform the task, time spent looking at a map, etc). With this experimental data, we used supervied learning ML models to classify them. We use RF, kNN, SVD, Naive Bayes classifier(NBC) obtaining up to 96% accuracy. We also make cross validation of the models. 

