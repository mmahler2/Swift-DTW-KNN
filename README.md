# K-Nearest Neighbors + Dynamic Time Warping

This library aims to provide a simplistic implementation of the KNN+DTW machine learning algorithm.

---

## How Do Use?
Just drag KNNDTW.swift into your project. Simple as that.

A demo project also lives in this repo, but further explanation of the library is down [below](#use).

___

## Not familiar with DTW or KNN?

Let me give you a quick intro to both, and why cool things happen when you use them together.

**KNN**  
Let's say you have a few labeled points on a graph. Blue dots are "dinosaurs", red dots are "bananas":  
![KNN Graph](https://mstatic.us/github/knn+dtw/knn.png)  
We're interested in classifying the orange dot. Is it a dinosaur or a banana? Intuition tells us, quite obviously, that it is a dinosaur. The KNN algorithm will also tell us it is a dinosaur, but it uses maths to figure that out like so:
1. Calculate the linear distance (or cost) between the orange dot and all the other dots.
2. Pick "K" neighbors of the orange dot which are the nearest (or have the least cost to travel to).
3. Of these closest dots, classify according to majority vote.

So, using this train of thought, we can see that if we choose the 3 closest dots to the orange dot, the vote will be unanimously in favor of a dinosaur.

Got it? Cool. Lets to DTW now.

**DTW**

It is possible that our "dots" above could be a little more complicated than just an (x,y) position. Perhaps each dot is actually a curve or time-series data of some sort, like so:
![DTW Graph](https://mstatic.us/github/knn+dtw/dtw.png)
Again, its quite obvious that the orange and blue graphs are closer in structure and form than the red graph.  
Dynamic Time Warping gives us a way to mathematically generate a constant that represents the "distance" or "cost" between two curves.
We use this "cost" as our distance in KNN.
___

## Methods, Structures, and General Use. <a name="use" id="use"></a>

```swift
//declare an array of curve/label pairs
var training_samples: [knn_curve_label_pair] = [knn_curve_label_pair]()

//add a couple curve/label pair to the training data
training_samples.append(knn_curve_label_pair(curve: [1,2,3,4,5], label: "dog"))
training_samples.append(knn_curve_label_pair(curve: [1,1,0,1,0], label: "cat"))

//intantiate the library
let knn_dtw: KNNDTW = KNNDTW()

//train the model with known samples
knn.train(training_samples)

//get a prediction
let prediction: knn_certainty_label_pair = knn.predict([1.0, 2, 3, 5, 6])

print("predicted " + prediction.label, "with ", prediction.probability*100,"% certainty")
```
