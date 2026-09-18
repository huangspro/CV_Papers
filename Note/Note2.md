# LVLM-empowered Multi-modal Representation Learning for Visual Place Recognition
## method:
 - extract text discription of query images by LVLM.
 - recalibrate the test tokens by interacting with images tokens.
 - fuse text and images tokens trough cross-attention layers
 - output the global represention of the original Query.

## core idea
 - using text discription extracted from the query images to improve the query represention itself.
 
# DialogueVPR: Towards Conversational Visual Place Recognition
## method:
 - implementing a loop:
 - search candidates images from database based on the original discription of users.
 - generate new questions based on the candidates by llm.
 - after users answer the question, implement the loop again.
 - till the model believes that the disctiptions match the candidates well enough
 
##core idea
 - using dialogue loop to augment searching, which is more in line with the normal daily place recognition.
 
# GeoBridge: A Semantic-Anchored Multi-View Foundation Model Bridging Images and Text for Geo-Localization
## method:
 - input drone-view, satellite-view, street-view scene images and a piece of text discription,
 - encode them into 4 vectors.
 - pairwise comparision, and the loss function comprises 4 number which repectively represent the loss of each pairs.
 - implement searching

## core idea:
 - align different modalities into a same latent space.

# Towards Natural Language-Guided Drones: GeoText-1652 Benchmark with Spatial Relation Matching
## just a dataset


