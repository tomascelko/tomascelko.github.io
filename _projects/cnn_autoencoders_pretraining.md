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

We have chosen the EfficientNetB4 as our model architecture of the encoder. For the decoder, we transpose the architecture of the encoder.

## Input
As input to the model we use 3 channel image of size 384x384, which is upsampled image of the cluster (up to 5x size increase in each dimension).
- First chanel is dedicated to deposited energy for each pixel. 
- Second channel is for the time of arrival of each pixel
- Third channel contains binary map of the pixels above certain energy threshold
Data is normalized using sqare-root normalization.


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
        {% include figure.liquid loading="eager" path="assets/AE_CNN/curve.gif" title="Reconstruction of  energy of a curly track using CNN autoencoder as a function of number of training iterations" class="img-fluid rounded z-depth-1" %}
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

