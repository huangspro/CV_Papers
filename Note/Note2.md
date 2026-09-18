# Brief Summary of text-VPR papers

1. LVLM-empowered Multi-modal Representation Learning for Visual Place Recognition
   - **Method**:
     - Extract text description of query images by LVLM.
     - Recalibrate the text tokens by interacting with image tokens.
     - Fuse text and image tokens through cross-attention layers.
     - Output the global representation of the original Query.
   - **Core idea**:
     - Using text description extracted from the query images to improve the query representation itself.

2. DialogueVPR: Towards Conversational Visual Place Recognition
   - **Method**: (using very completed engineering methods)
     - Implementing a loop:
     - Search candidate images from database based on the original description of users.
     - Generate new questions based on the candidates by LLM.
     - After users answer the question, implement the loop again.
     - Till the model believes that the descriptions match the candidates well enough.
   - **Core idea**:
     - Using dialogue loop to augment searching, which is more in line with the normal daily place recognition.

3. GeoBridge: A Semantic-Anchored Multi-View Foundation Model Bridging Images and Text for Geo-Localization
   - **Method**:
     - Input drone-view, satellite-view, street-view scene images and a piece of text description.
     - Encode them into 4 vectors.
     - Pairwise comparison, and the loss function comprises 4 numbers which respectively represent the loss of each pair.
     - Implement searching.
   - **Core idea**:
     - Align different modalities into the same latent space.

4. Towards Natural Language-Guided Drones: GeoText-1652 Benchmark with Spatial Relation Matching
   - **Method**:
     - Just a dataset.

5. LaVPR: Benchmarking Language and Vision for Place Recognition
   - **Method**:
     - Compare different methods for fusion: CAT, PA, MLP, ADS(output a scale similarity)
     - Using MS loss
     - Using LoRA to fine tune the pre-trained model to align vision and language

6. Bridging Text and Vision: A Multi-View Text-Vision Registration Approach for Cross-Modal Place Recognition
   - **Method**:
     - **Stage 1**: Training, aligning one piece of text and one image
       - Using frozen T5 model to encode text discriptions
       - Using ViT to encode an image and **sinkhorn algorithm** to get cluster sets.
       - Get the cluster tokens
       - Compare iamge cluster tokens and tokens from text
     - **Stage 2**: Infering
       - Given 4 textual entries as queries, encode them into 4 vectors
       - Get an entry from database, which possesses 4 views of street scene(up, down, left, right). encode them
       - Pass the 4 textual queries and 4 images representationss into a Cascaded Cross-Attention Cosine Alignment (CCCA) module, which performs cross attention between images and texts
       - Calculate the similarity between 4 text discriptions and the 4 iamge entries
       - Implement the process on all entries in the database and get tht candidates.

7. ProGEO: Generating Prompts through Image-Text Contrastive Learning for Visual Geo-localization
  - **Method**:
    - **Stage1**:
      - initialize a learnable prompt embedding, and then encode the prompt into a vector. 
      - align the prompt represtion with images represention through Contrastive learining loss.
      - note that at Stage1 the text encoder and the image encoder are both frozen, only the prompt are trained

    - **Stage2**:
      - both the text encoder and learned prompt are frozen, and only the image encoder are trained
      - using 3 kind of loss to narrow the distance between representions of images and text prompts.

  - **core idea**:
    - firstly train a prompt as a **Teacher**
    - train the image encoder to fit the **Teacher** 
