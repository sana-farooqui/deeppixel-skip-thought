# deeppixel-skip-thought
## deepPIXEL Skills Assessment Task 2

### Evaluation Instructions

1. Download the [skip-thoughts model](https://github.com/tensorflow/models/tree/master/research/skip_thoughts) and [training code](https://github.com/ryankiros/skip-thoughts).
2. Follow instructions [here](https://github.com/tensorflow/models/blob/master/research/skip_thoughts/README.md#download-pretrained-models-optional) to download pretrained models.
3. Modify file paths in eval.sh and run it to evaluate the model on either SICK or MSRP.

### Training Instructions

#### Preparing the input data
1. Download Wikipedia [corpus](https://en.wikipedia.org/wiki/Wikipedia:Database_download)
2. Download the [WikiExtractor tool](https://github.com/attardi/wikiextractor) to clean and split the dump into text files (1MB each).
3. Run prepare_corpus.py to prepare the text files for final preprocessing.
4. Run preprocess.sh to create the input data for the model

#### Training & Expanding the Vocabulary
1. Modify any training parameters in skip_thoughts/configuration.py
2. Run train.sh
3. Download pretrained word2vec embeddings [here](https://drive.google.com/file/d/0B7XkCwpI5KDYNlNUTTlSS21pQmM/edit?usp=sharing)
4. Run expand.sh

Now you should have all the files required to evaluate the embeddings.