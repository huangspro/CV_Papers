2026-9-24
# 关于近期遍历的关于textVPR的论文的笔记
近期阅读的textVPR论文展示了该方向从**兴起**到**复杂工程化**的过程。
  - 起初的论文主要聚焦于验证模态融合和对齐的方法，致力于配准不同模态向量的表示。**(3, 6, 7, 8)**
  - 一些工作逐渐聚焦于如何将pretrained model进行fine tunning，使其满足VPR的专用领域。**(5)**
  - 或者利用文本描述提升VPR的原有效果。**(1, 7)**
  - 后期的工作逐渐聚焦于复杂度工程实现，将LLM和VPR结合，通过多轮对话，heat map推理等等提高VPR的精度，并使其更加符号人类过程。**(2, 8)**

## 在一些工作中，出现了两种不同的对text利用的思路，这两种思路对text的利用方式并不相同。
### 方式一：Text作为用户的Query
  - 将text作为用户的query，与图片一起输入模型并对齐，融合，得到**global representation**，然后在数据库中进行检索。
  - 这种方式聚焦于模拟真实的文本搜索的过程，致力于对齐。
  - **注：需要注意的是，这种方式主要利用融合算法和对比学习手段，前者需要人类设计loss function，后者在克服了工程问题后主要以来于数据驱动。**
  
### 方式二：Text作为教师
  - 首先使用**Large vision language model**为**query图片**添加文本描述，然后将图片与文本融合得到global representation，最后进行数据库检索。
  - 这种方式本质上与方式一不同，其文本描述并非来自用户，而是来自LLM。本质上，它使用LVLM提取了图片中的一些特征并将它们用文本描述。而image encoder也能提取一部分的特征。两种模态的融合就是这些特征的综合。
  - 所以，本质上，这种方法使用文本和image encoder来提取特征并融合两种途径。而原先的方法只使用image encoder提取特征。所以，这种方法相当于蒸馏了LVLM的多模态能力。
  - **！！注：这种方法蕴含巧妙的思想，提示我们不同领域的能力可以以教学的方式传递和利用。**
  
## 值得思考的创新方式
上述工作互不相同，思考他们是怎么想到的是重要的！
1. 思考之一是模拟人类的思维方式：人类总是将不同的模态的记忆互相对比，互相校准，结果使得不同模态竟然能够相互适应，互相验证。
2. 其余有待思考

## 小思考
### 思考1
  - 文本与图片结合能够提升VPR 的准确率，是因为文本能提供单一模态可能难以注意到的特征和语义！！那么，能否只使用文本描述呢？
  - 设想一个地理信息数据库中的每一张图片都装备了充分的文本描述，以至于任何一张图片中的所有所需的定位信息都能够文本化。
  - **那么，问题能不能转化为纯粹的文本检索？**

### 思考2
  - 人在地点记忆匹配的时候，会根据询问者的描述来调整自己的注意力。
  - 模型一开始接受图片query时并没有文本参与，而是embedding完成后才与文本进行注意力等等。
  - 模型能否发现文本中描述了一些自己忽略掉的特征，能否自己回到图片进行重新特征提取？
  - **也就是说，image encoding阶段能不能使文本参与？**，因为模型在别的图片上学习到的特征提取方式并不一定能很好地符合当前文本的描述。

## References
1. LVLM-empowered Multi-modal Representation Learning for Visual Place Recognition
2. DialogueVPR: Towards Conversational Visual Place Recognition
3. GeoBridge: A Semantic-Anchored Multi-View Foundation Model Bridging Images and Text for Geo-Localization
4. Towards Natural Language-Guided Drones: GeoText-1652 Benchmark with Spatial Relation Matching
5. LaVPR: Benchmarking Language and Vision for Place Recognition
6. Bridging Text and Vision: A Multi-View Text-Vision Registration Approach for Cross-Modal Place Recognition
7. ProGEO: Generating Prompts through Image-Text Contrastive Learning for Visual Geo-localization
8. Where am I? Cross-View Geo-localization with Natural Language Descriptions
