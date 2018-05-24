import re
from nltk import tokenize

num_files = 35
path = "AB/"

for i in range(num_files):
    f = open(path+"wiki_%02d" % i, "r")
    text = f.read()
    f.close()
    # remove tags and new line chars
    text = re.sub(r"<doc.+?>\n.+?\n\n", "", text)
    text = re.sub(r"<.+?>", "", text)
    text = re.sub("\n", "", text)
    # make unicode and tokenize by sentence
    text = text.decode("UTF-8")
    sentences = tokenize.sent_tokenize(text)
    # make strings and write to file
    sentences = [(sent+"\n").encode("UTF-8") for sent in sentences]
    new = open(path+"wiki_%02d_new.txt" % i, "w")
    new.writelines(sentences)
    new.close()


