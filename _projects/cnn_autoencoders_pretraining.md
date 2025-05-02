---
layout: page
title: Pretraining of deep CNN autoencoders
description: Autoencoders pretrained on unlabeled data from Timepix3 to improve accuracy.
importance: 1
category: work
---

## Goal

The goal of the project is to show how pretraining autoencoders based on CNNs can be used to learn feature extraction and subsequently finetune for specific task.
This page was made to showcase some of the figures relevant to the project.

## Model

We have chosen the EfficientNetB4 as our model architecture of the encoder. For the decoder, we transpose the architecture of the encoder. Additionally, we attach multiple heads to the model - 
- First head predicts the image on the input
- Second head predicts binary mask of the whole cluster
- Third head predict the binary mask of pixels above fixed threashold

### Variations
- Different levels of input pixel masking were tried (0%, 25% and 50%)
- Variations with or without binary mask head were tested


## Input
As input to the model we use 3 channel image of size 384x384, which is upsampled image of the cluster (up to 5x size increase in each dimension).
- First chanel is dedicated to deposited energy for each pixel. 
- Second channel is for the time of arrival of each pixel
- Third channel contains binary map of the pixels above certain energy threshold
Data is normalized using sqare-root normalization.

## Training

### Pretraining

The pretraining has two stages :

1. Standard pretraining on Imagenet dataset - we simply download the pretrained weights from for this torchvision model.


2. Part of the data for unsupervised pretraining is obtained from Timepix3 measurements in ATLAS. This dataset contains high variability of clusters but smaller clusters are much more frequent. This is the reason why we also used ions data obtained at test beam measurements of Pb at SPS at Cern - these have higher frequency of large clusters. 

Dataset is balanced into exponentially sized bins based on cluster hit count. We then downsample the clusters so that the frequency across the bins is unfiorm.


<div class="row">
  <figure class="text-center">
    {% include figure.liquid 
        loading="eager" 
        path="assets/AE_CNN/curve.gif" 
        title="Reconstruction of energy of a curly track using CNN autoencoder as a function of number of training iterations" 
        class="img-fluid rounded z-depth-1" 
    %}
    <figcaption class="mt-2 text-muted">
      Reconstruction of energy of a curly track using a CNN autoencoder as a function of training iterations.
    </figcaption>
  </figure>
</div>

<div class="row">
        <figure class="text-center">
        {% include figure.liquid loading="eager" path="assets/AE_CNN/curve2.gif" title="Reconstruction of  energy of a curly track using CNN autoencoder as a function of number of training iterations" class="img-fluid rounded z-depth-1" %}
        </figure>
</div>

<div class="row">
        <figure class="text-center">
        {% include figure.liquid loading="eager" path="assets/AE_CNN/hblob.gif" title="Reconstruction of  energy of ion track using CNN autoencoder as a function of number of training iterations" class="img-fluid rounded z-depth-1" %}
        </figure>
</div>

<div class="row">
<figure class="text-center">
        {% include figure.liquid loading="eager" path="assets/AE_CNN/hion.gif" title="Reconstruction of  energy of ion track using CNN autoencoder as a function of number of training iterations" class="img-fluid rounded z-depth-1" %}
         </figure>
</div>

<div class="row">
<figure class="text-center">
        {% include figure.liquid loading="eager" path="assets/AE_CNN/htrack.gif" title="Reconstruction of ion track using CNN autoencoder as a function of number of training iterations" class="img-fluid rounded z-depth-1" %}
         </figure>
</div>

#### What happens, if we do not use binary pixel masking?
Suddenly, the thin tracks become more blurry as we can see below.

<div class="row">
<figure class="text-center">
        {% include figure.liquid loading="eager" path="assets/AE_CNN/curve_no_mask.gif" title="Reconstruction of electron track using CNN autoencoder as a function of number of training iterations. This time, no binary mask predicition is used" class="img-fluid rounded z-depth-1" %}
         </figure>
</div>
<div class="row">
<figure class="text-center">
        {% include figure.liquid loading="eager" path="assets/AE_CNN/htrack_no_mask.gif" title="Reconstruction of ion track using CNN autoencoder as a function of number of training iterations. This time, no binary mask predicition mask is used" class="img-fluid rounded z-depth-1" %}
         </figure>
</div>


#### Key observations:
- addition of binary mask predicition non-trivially increased the sharpness of the recontructed image
- we were able to reconstruct simple, linear tracks with high precision
- heavy ions were reconstructed too but reconstructing areas with high density of delta electrons ended up blurred

### Supervised finetuning

Data for supervised finetuning is obtained from simulations. For instance, we simulate protons and electrons for SATRAM experiment with Timepix1. Currently, there is a lack of standardized benchmarking datasets for this type of detectors, so besides simulation of real spectrum for SATRAM instrument, we also created identical spectrum to the one mentioned in this paper <a href="https://hal.science/hal-03238974v1/document"> </a>, further referred to as "reference spectrum" as opposed to the original "real spectrum".


<div class="row">
<figure class="text-center">
        {% include figure.liquid loading="eager" path="assets/AE_CNN/electron_real_spectrum.jpg" title="Simulated real SATRAM electron spectrum" class="img-fluid rounded z-depth-1" %}
         </figure>
</div>

<div class="row">
<figure class="text-center">
        {% include figure.liquid loading="eager" path="assets/AE_CNN/proton_real_spectrum.jpg" title="Simulated real SATRAM proton spectrum" class="img-fluid rounded z-depth-1" %}
         </figure>
</div>

#### Validation 
<div class="row">
<figure class="text-center">
        {% include figure.liquid loading="eager" path="assets/AE_CNN/mask.png" title="Validation accuracy for simulated SATRAM data during training" class="img-fluid rounded z-depth-1" %}
        <figcaption class="mt-2 text-muted">
        On the plot we can see how validation accuracy improves over the course of training. We can observe that pixel masking does not seem to have any measurable influence on the classifier accuracy.
        </figcaption>
         </figure>
</div>
<div class="row">
<figure class="text-center">
        {% include figure.liquid loading="eager" path="assets/AE_CNN/marie.png" title="Validation accuracy for simulated SATRAM data during training" class="img-fluid rounded z-depth-1" %}
        <figcaption class="mt-2 text-muted">
        n the plot we can see how validation accuracy improves over the course of training. The plot shows comparison of three methods - real spectrum as created in our simulations, reference spectrum recreated as shown in <a href="https://hal.science/hal-03238974v1/document"> </a> and its variant with tracks containing more than 8 pixles. The main observation is that the reference spectrum seems to be easier to separate than the real one and most of its errors come from clusters with less than 8 pixels.  
        </figcaption>
         </figure>
</div>
<div class="row">
<figure class="text-center">
        {% include figure.liquid loading="eager" path="assets/AE_CNN/training_gain.png" title="Validation accuracy for simulated SATRAM data during training" class="img-fluid rounded z-depth-1" %}
         <figcaption class="mt-2 text-muted">
        In this plot we can see the overall difference of non-pretrained efficient net model classification and the pretrained one. One can see that the overall validation accuracy for the real spectrum is slightly better for pretrained model, than the non-pretrained one. Even though the maximum achieved accuracy is not drastically better, the convergence speed difference between pretrained and non-pretrained model is evident. 
        </figcaption>
        </figure>
</div>

#### Separated protons and electron feature vectors
<div class="row">
<figure class="text-center">
        {% include figure.liquid loading="eager" path="assets/AE_CNN/umap_mask0_after.png" title="Projection of extracted features of each cluster to 2D using UMAP" class="img-fluid rounded z-depth-1" %}
         <figcaption class="mt-2 text-muted">
      Projection of feature vector obtained from CNN encoder into 2D AFTER unsupervised pretraining on ATLAS data and also AFTER supervised finetuning to split protons from electrons. Some tracks were selected (using K-means) and for these we also show energy deposition and the tracks shape in a square box. We can see that tracks with similar angle are close together indicating model learned the feature to recognize particle angle. Another extracted feature seems to be track length. This indicates that model is indeed building meaningful and interpretable features.
    </figcaption>
         </figure>
</div>

#### Key observations
- two of the most important extracted features by the model were track length and angle of the track
- by using the pretrained model, we were able to improve the separation of protons and electrons on reference spectrum from reported 94.79% to our 96.2%
- we have shown that most of the errors are caused by lack of information (tracks smaller than 8 pixels), after filtering those we achieved >99% accuracy on a balanced dataset




