# Current Errata

&nbsp;
## Chapter 1

Not an errata but an improvement suggestion. Currently, we have the following paragraph in the "Notational Conventions" section:


We will use lowercase, bold-face letters to refer to vectors ($\mathbf{x} \in \mathbb{R}^{n \times 1}$) and uppercase, bold-face letters to refer to matrices $(\mathbf{X} \in \mathbb{R}^{n \times m}$). To refer to single elements in a vector or matrix, we will write the letters in italics $(x^{(n)}$ or $x_m^{(n)}$, respectively).


This can be improved as follows:


We will use lowercase, bold-face letters to refer to vectors ($\mathbf{x} \in \mathbb{R}^{n \times 1}$ for column vectors and $\mathbf{x} \in \mathbb{R}^{1 \times m}$ for row vectors) and uppercase, bold-face letters to refer to matrices $(\mathbf{X} \in \mathbb{R}^{n \times m}$). To refer to single elements in a vector or matrix, we will write the letters in italics $(x^{(n)}$ or $x_m^{(n)}$, respectively).

In addition, in the same box, 

$$
\mathbf{X}^{(i)} = \left[ x_1^{(i)} \, x_2^{(i)} \, x_3^{(i)} \, x_4^{(i)} \right]
$$

can be changed to

$$
\mathbf{x}^{(i)} = \left[ x_1^{(i)} \, x_2^{(i)} \, x_3^{(i)} \, x_4^{(i)} \right], \quad 1 \leq i \leq n.
$$

And

$$
\mathbf{x}_j = \left[ \begin{array}{c}
x_j^{(1)} \\
x_j^{(2)} \\
\vdots \\
x_j^{(150)}
\end{array} \right]
$$

can be changed to

$$
\mathbf{x}_j = \left[ \begin{array}{c}
x_j^{(1)} \\
x_j^{(2)} \\
\vdots \\
x_j^{(150)}
\end{array} \right], \quad i \leq j \leq m.
$$

&nbsp;
## Chapter 2

**Page 23**

In the perceptron learning rule example, the predicted label $\hat{y}^{(i)}$ and the true label $y^{(i)}$ are flipped. The example should use

```math
\hat{y}^{(i)} = 0, \quad y^{(i)} = 1, \quad \eta = 1
```

instead of

```math
\hat{y}^{(i)} = 1, \quad y^{(i)} = 0, \quad \eta = 1
```

Source: [#225](https://github.com/rasbt/machine-learning-book/issues/225)

**Page 38**

In the MSE derivative, the final summation should be over the feature index $j$, not over the training-example index $i$.

Source: [#64](https://github.com/rasbt/machine-learning-book/issues/64)


&nbsp;
## Chapter 3

**Page 66**

The doc strings of the LogisticRegressionGD classifier reference "Mean squared error loss". This is a copy-paste error and should be "Log loss".

Source PR: [#98](https://github.com/rasbt/machine-learning-book/pull/98)

**Page 67**

In the LogisticRegressionGD loss calculation, the division by `X.shape[0]` should apply to the full loss expression, not just the second term.

Source PRs: [#104](https://github.com/rasbt/machine-learning-book/pull/104), [#241](https://github.com/rasbt/machine-learning-book/pull/241)

**Page 84**

A larger gamma value should create a smaller (not larger) radius.

**Page 94**

The decision tree example uses only petal length and petal width, so the corresponding `feature_names` list should be

```python
feature_names = ['Petal length', 'Petal width']
```

instead of

```python
feature_names = ['Sepal length', 'Sepal width', 'Petal length', 'Petal width']
```

Sources: [#101](https://github.com/rasbt/machine-learning-book/issues/101), PR [#226](https://github.com/rasbt/machine-learning-book/pull/226)

&nbsp;
## Chapter 4

In the code block, it says

```python
# Note that C=1.0 is the default. You can increase
# or decrease it to make the regulariztion effect
# stronger or weaker, respectively.
```

But should have been "weaker or stronger" not "stronger or weaker"

&nbsp;
## Chapter 5

**Page 143**

The text says that the covariance between two features is calculated
"on the population level," but the displayed formula uses the sample
covariance normalization term $1/(n-1)$. The wording should be
"on the sample level."

Source: [#229](https://github.com/rasbt/machine-learning-book/issues/229)

**Page 157-158**

In the LDA section, the within-class scatter matrix should not be
computed by summing unweighted class covariance matrices. Since `np.cov`
uses the unbiased normalization by default, each class covariance matrix
should be multiplied by `n_i - 1` before adding it to `S_W`.

Source: [#169](https://github.com/rasbt/machine-learning-book/issues/169)

&nbsp;
## Chapter 6

**Page 185**

In the Figure 6.6 caption, it currently says "...SVM hyperparameter C" but it should say "...logistic regression hyperparameter C".

&nbsp;
## Chapter 7

**Page 239**

In the logistic loss equation for a single training example, the second
term should be subtracted, not added. The equation should be

```math
L_i = -y_i \log(p_i) - (1 - y_i)\log(1 - p_i)
```

instead of

```math
L_i = -y_i \log(p_i) + (1 - y_i)\log(1 - p_i)
```

Source: [#239](https://github.com/rasbt/machine-learning-book/issues/239)

&nbsp;
## Chapter 10

**Page 313**

In the sentence "...identify the value of k where the distortion begins to increase most rapidly..." *decrease* would be the more correct term as we read the figure from left to right (not right to left).

&nbsp;
## Chapter 11

**Page 341**

Add bias unit to the net input.

**Page 354**

The MSE is normalized via `mse = mse/i` but should be normalized via `mse = mse/(i+1)` instead. (This does not affect the results in shown below though. The MSE is still 0.3.)

**Page 366**

It says 

```math
\frac{\partial L}{\partial w_{1,1}^{(\text {out })}} = ...
```

 but should be 

 ```math
\frac{\partial L}{\partial w_{1,1}^{(\text {h })}}
 ```

to match the figure above and text below.

**Page 361**

```math
\frac{\partial}{\partial w_{j, l}^{(l)}}=L(\boldsymbol{W}, \boldsymbol{b}) 
```

should be 

```math
\frac{\partial L}{\partial w_{j, l}^{(l)}}
```


&nbsp;
## Chapter 12

**Page 376**

The text says 

> For this, PyTorch provides a convenient torch.chunk() function, which divides an input tensor into a list of equally
sized tensors. [...] If the tensor size is not divisible by the chunks value, the last chunk will be smaller.

But this is not necessarily true. A better way to say this, as suggested in the discussion [#203](https://github.com/rasbt/machine-learning-book/discussions/203), is

> If the tensor size is not divisible by the chunks value, the resulting number of chunks may be less than intended and/or the last chunk may be smaller than the others.


**Page 380**

We use `TensorDataset` even though we defined the custom `JointDataset`

**Page 393**

The line `y_pred = model(X_test_norm).detach().numpy()` should be changed to just `y_pred = model(X_test_norm)` to avoid detaching twice, which know raises an error in PyTorch 2.x.


**Page 431**

When using Torchmetrics 0.8.0 or newer, the following lines

```python
self.train_acc = Accuracy()
self.valid_acc = Accuracy()
self.test_acc = Accuracy()
```

need to be changed to

```python
self.train_acc = Accuracy(task="multiclass", num_classes=10)
self.valid_acc = Accuracy(task="multiclass", num_classes=10)
self.test_acc = Accuracy(task="multiclass", num_classes=10)
```


&nbsp;
## Chapter 13


**Page 423**

At the bottom of this page, it says

> and the
model reaches 100 percent accuracy on the training dataset. The validation dataset’s accuracy is 95 percent, which indicates that the model is slightly overfitting.

But the values should be 90% training accuracy and 85% validation accuracy.

**Page 432**

The line `import sklearn.model_selection` is redundant and can be removed.

&nbsp;
## Chapter 14


**Page 459**

The `conv1d()` and `conv2d()` functions on page 459 was improved through a kind [pull request](https://github.com/rasbt/machine-learning-book/pull/168) by [@JaGeo](https://github.com/JaGeo), enabling it to handle cases with strides different from (1,1).


**Page 489**

Not an error, but for legibility, it would be good to change 

```python
for j in range(num_epochs):
    img_batch, label_batch = next(iter(data_loader))
```

to

```python
for img_batch, label_batch in data_loader:
```

&nbsp;
## Chapter 15

**Page 505**

The equation is technically correct, but it looks like the character 0 (zero) was used instead of the letter o:

```math
\mathbf{o}^{\left( t \right)} = \sigma_{0}\left( \mathbf{W}_{ho}\mathbf{h}^{\left( t \right)}+\mathbf{b}_{0} \right)
```
should be

```math
\mathbf{o}^{\left( t \right)} = \sigma_{o}\left( \mathbf{W}_{ho}\mathbf{h}^{\left( t \right)}+\mathbf{b}_{o} \right)
```

**Page 530**

The line `from torch.utils.data import Dataset` appears twice.

&nbsp;
## Chapter 16

**Page 547**

Not an error, but where we are summing over the columns via `attention_weights.sum(dim=1)`, we could mention that this matrix is symmetric and that we could also sum over the rows and get the same results.

---

&nbsp;
## Chapter 17

**Page 626**

There seems to be a mistake in the KL information box. The minus sign should either be removed or the P(x)/Q(x) should be changed to  Q(x)/P(x). In addition, there log sign seems missing. Correct formulas are

```math
KL(P \| Q) = -\sum_{i} P(x_i) \log \frac{Q(x_i)}{P(x_i)}
```

or

```math
KL(P \| Q) = \sum_{i} P(x_i) \log \frac{P(x_i)}{Q(x_i)}
```


For books printed before 16 Nov 2022, please see the [Old Errata](old-errata).
