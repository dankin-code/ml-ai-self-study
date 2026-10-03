# Machine Learning & AI — 30-Day Intensive Learning Path

> Converted from `ML_AI_30_Day_Learning_Path.docx` (also available as `.pdf`).
> 30-day, 10-hours-a-day program — 300 study hours · Target: Applied ML / Generalist role

**Built from three books:**

| Code | Book | Role in the plan | Folder |
|------|------|------------------|--------|
| **PS** | *Practical Statistics for Data Scientists* (O'Reilly) | The **why** — statistical foundations, sampling, experiments, math intuition | `books/Book-PS-Orielly-Practical-Statistics/` |
| **ML** | *Machine Learning with PyTorch and Scikit-Learn* (Packt) | The **how** — classical ML in scikit-learn, then deep learning in PyTorch | `books/Book-ML-Packt-Machine-Learning-Pytorch-ScikitLearn/` |
| **BE** | *Python Machine Learning by Example, 4th Ed.* (Packt) | The **do** — real end-to-end projects for the portfolio | `books/Book-BE-Packt-Python-Machine-Learning-by-Example-Fourth-Edition-main/` |

---

## Contents

1. [Repository map](#repository-map)
2. [How to use this plan](#how-to-use-this-plan)
3. [Daily rhythm (10 hours)](#daily-rhythm-10-hours)
4. [Day 0: before you start](#day-0-before-you-start-evening-prep)
5. [Week 1 — Foundations](#week-1--foundations-environment-statistics--first-models)
6. [Week 2 — Classical ML mastery](#week-2--classical-ml-mastery)
7. [Week 3 — Deep learning](#week-3--deep-learning)
8. [Week 4 — Modern AI, capstone & interview readiness](#week-4--modern-ai-capstone--interview-readiness)
9. [Project portfolio](#project-portfolio)
10. [Interview-prep track](#interview-prep-track)
11. [Job-readiness checklist](#job-readiness-checklist)
12. [Staying on track](#staying-on-track)

---

## Repository map

```
ml-ai-self-study/
├── CLAUDE.md                          # Instructions for Claude as step-by-step tutor
├── README.md                          # Synopsis of goals, roadmap, portfolio
├── ML_AI_30_Day_Learning_Path.md      # This file (from the .docx)
├── ML_AI_30_Day_Learning_Path.docx    # Original plan (Word)
├── ML_AI_30_Day_Learning_Path.pdf     # Original plan (PDF)
├── books/                             # Companion code for the three books
│   ├── Book-PS-Orielly-Practical-Statistics/
│   ├── Book-ML-Packt-Machine-Learning-Pytorch-ScikitLearn/
│   └── Book-BE-Packt-Python-Machine-Learning-by-Example-Fourth-Edition-main/
├── data/                              # Personal datasets for applied work
├── journal/                           # Daily learning journal
├── notebooks/                         # My own practice notebooks
└── projects/                          # The 8 portfolio projects
```

### `books/Book-PS-Orielly-Practical-Statistics/` — PS

| Path | Contents |
|------|----------|
| `python/notebooks/` | Chapter 1–7 notebooks: Exploratory Data Analysis · Data and Sampling Distributions · Statistical Experiments and Significance Testing · Regression and Prediction · Classification · Statistical Machine Learning · Unsupervised Learning (plus `common.py` helper) |
| `python/code/` | Same seven chapters as plain `.py` scripts |
| `R/notebooks/`, `R/code/` | R versions of the seven chapters (reference only) |
| `data/` | Book datasets — e.g. `state.csv`, `loan_data.csv`, `house_sales.csv`, `web_page_data.csv`, `click_rates.csv`, `sp500_data.csv.gz`, `lc_loans.csv`, `airline_stats.csv` |
| `environment.yml`, `requirements.txt`, `docker/` | Environment setup |

### `books/Book-ML-Packt-Machine-Learning-Pytorch-ScikitLearn/` — ML

Each `chNN/` folder has a `README.md`, a `chNN.ipynb` notebook (some split into parts), a matching `.py`, and a `figures/` folder.

| Chapter | Topic | Notable files / data |
|---------|-------|----------------------|
| ch01 | ML landscape & tooling | `python_environment_check.ipynb` |
| ch02 | Perceptron & Adaline from scratch | `iris.data` |
| ch03 | Tour of scikit-learn classifiers | |
| ch04 | Data preprocessing | `wine.data` |
| ch05 | Dimensionality reduction (PCA, LDA, kernel PCA) | `wine.data` |
| ch06 | Model evaluation & hyperparameter tuning | `wdbc.data` (breast cancer) |
| ch07 | Ensemble learning | `wine.data` |
| ch08 | Sentiment analysis | `movie_data.csv.gz`, `logistic-regression-bag-of-words/` |
| ch09 | Regression | `AmesHousing.txt` |
| ch10 | Clustering | |
| ch11 | Multilayer NN from scratch | `neuralnet.py` |
| ch12 | PyTorch basics | `cat_dog_images/`, parts 1–2 |
| ch13 | PyTorch mechanics | parts 1–2, `part3_lightning`, `part4_ignite`, `lightning_logs/` |
| ch14 | CNNs | parts 1–2, `example-image.png` |
| ch15 | RNNs / LSTMs | parts 1–3, `1268-0.txt` (text corpus) |
| ch16 | Transformers (self-attention, GPT-2, BERT) | 3 parts + `bonus-distilbert-lightning-trainer/` |
| ch17 | GANs | parts 1–2 |
| ch18 | Graph neural networks | parts 1–2 |
| ch19 | Reinforcement learning | `cartpole/`, `gridworld/` |
| `supplementary/` | `running-on-colab.pdf` | |
| `ERRATA/` | Book corrections | |
| root | `environment.yml`, `python_environment_check.py` | |

### `books/Book-BE-Packt-Python-Machine-Learning-by-Example-Fourth-Edition-main/` — BE

Each `chN/` folder contains `chN_partX.ipynb` notebooks with matching `.py` scripts. (There is no `ch1/` — Chapter 1 has no code.) Has its own `CLAUDE.md`.

| Chapter | Topic | Notable files / data |
|---------|-------|----------------------|
| ch2 | Naive Bayes movie recommender | parts 1–2 |
| ch3 | Tree-based ad click-through prediction | parts 1–2 |
| ch4 | Logistic regression, SGD, online learning | parts 1–2 |
| ch5 | Stock-price regression | `19900101_20230630.csv`, `20051201_20051210.csv` |
| ch6 | Neural networks (activation, feedforward, backprop) | parts 1–2 |
| ch7 | Text analysis, embeddings, t-SNE | part 1 |
| ch8 | Topic modeling | parts 1–2 |
| ch9 | SVM face recognition | parts 1–2 |
| ch10 | 21 ML best practices | parts 1–2 |
| ch11 | Clothing images CNN, augmentation, transfer learning | part 1 |
| ch12 | RNNs: sentiment, forecasting, text generation | parts 1–3, `warpeace_input.txt` |
| ch13 | BERT & GPT projects | parts 1–2, `warpeace_input.txt` |
| ch14 | CLIP image search, zero-shot classification | parts 1–2 |
| ch15 | Reinforcement learning | parts 1–2 |

### My working folders

| Folder | Contents |
|--------|----------|
| `data/` | `Credit_Card_Applications.csv`, `heart.csv` — personal datasets for applied blocks |
| `notebooks/` | `Exploratory Data Analysis.ipynb` (Day 2 EDA work) |
| `journal/` | Daily learning journal (create `journal/README.md` per Day 0) |
| `projects/` | Portfolio projects 1–8 go here |

---

## How to use this plan

**The goal.** Over the next 30 days, move from "some ML basics" to being able to walk into an Applied ML / Generalist interview and speak fluently about statistics, classical machine learning, and modern deep learning — backed by a portfolio of eight projects built yourself. This document is the daily operating manual: each day says exactly what to read, what to code, and what to produce.

**The three-book strategy.** The books are not read cover-to-cover in isolation. They are braided together by theme so each concept is hit three ways on the days it matters:

- **Practical Statistics for Data Scientists — the why.** Statistical foundations, sampling, experiments, and the math intuition behind models. This is what separates people who run scikit-learn from people who understand it.
- **Machine Learning with PyTorch and Scikit-Learn — the how.** The core technical spine: classical ML in scikit-learn, then deep learning in PyTorch, built up rigorously from first principles.
- **Python Machine Learning by Example — the do.** Real, end-to-end projects (recommenders, ad-click prediction, stock prediction, image and text models) that turn theory into a portfolio.

**How to read the schedule.** Each week is a table: the day, its theme, the exact chapters to read and code along with, and the concrete thing to have produced by the end of the day. **PS** = Practical Statistics · **ML** = ML with PyTorch & Scikit-Learn · **BE** = Python ML By Example.

**Non-negotiables for success:**

1. Type every code example yourself — never copy-paste.
2. Keep a daily learning journal in the Git repo.
3. Finish each day by explaining the day's key idea out loud in plain English.
4. Ship every project to GitHub, however rough. Consistency over perfection.

---

## Daily rhythm (10 hours)

Ten focused hours is a lot; structure protects against drift and burnout. Use this four-block template every day. Adjust the clock, but keep the proportions and the order — read, then build, then apply, then consolidate.

| Block | Time | What you do |
|-------|------|-------------|
| Theory & reading | 2.5 hrs | Read the day's chapter(s). Take structured notes in the journal: definitions, the intuition, and one question you still have. |
| Guided build | 3.0 hrs | Code along with the book's examples in a notebook. Run every snippet. Break it on purpose, then fix it — that is where learning happens. |
| Applied / project | 2.5 hrs | Apply the day's technique to your own dataset, or push the week's project forward. Aim for one working artifact per day. |
| Review & interview prep | 1.5 hrs | Flashcards, explain-aloud, 1–2 coding/ML interview questions, and log the day. Update the progress tracker. |

That is 9.5 hours of work plus a 0.5-hour daily planning-and-reflection buffer. Take real breaks between blocks — a rested brain retains far more.

---

## Day 0: before you start (evening prep)

Spend an hour the night before Day 1 so you never lose study time to setup:

- **Environment:** install Miniconda; create an env (Python 3.11) with numpy, pandas, matplotlib, seaborn, scikit-learn, jupyterlab, and PyTorch (CPU is fine; use Google Colab for GPU-heavy days in Weeks 3–4).
- **Version control:** create a GitHub repo with `/notebooks`, `/projects`, and `/journal` folders. Commit daily.
- **Datasets:** make a free Kaggle account (data + a place to publish notebooks). Bookmark the UCI ML Repository.
- **Journal:** create `journal/README.md` with a one-line-per-day template: *what I learned, what confused me, tomorrow's goal*.
- **Accounts:** Hugging Face (for Week 4 transformers) and, optionally, Weights & Biases for experiment tracking.

---

## Week 1 — Foundations: environment, statistics & first models

**Focus:** Build rock-solid statistical intuition and implement your first classifiers from scratch. This week is the foundation everything else stands on — do not rush it. By the end you will understand sampling, significance, and how a linear classifier actually learns.

| Day | Theme & focus | Read + code (book · chapter) | Deliverable / practice |
|-----|---------------|------------------------------|------------------------|
| 1 | Orientation & the ML landscape | ML Ch1 (ML types, model-building pipeline) · BE Ch1 (ML tasks, data & tools) | Working conda env + initialized GitHub repo; journal README; "hello ML" notebook running end to end |
| 2 | Exploratory Data Analysis | PS Ch1 (location & variability estimates, distributions, correlation, multivariable EDA) | EDA notebook on a real Kaggle CSV: summary stats, boxplots, histograms, correlation heatmap |
| 3 | Sampling & distributions | PS Ch2 (CLT, standard error, the bootstrap, confidence intervals, key distributions) | Notebook: bootstrap confidence intervals + a sampling simulation; a short written CLT explainer |
| 4 | Experiments & significance | PS Ch3 (A/B testing, hypothesis tests, p-values, t-tests, ANOVA, chi-square, power) | Simulate an A/B test + a permutation test; flashcards on p-values and Type I/II errors |
| 5 | ML from first principles | ML Ch2 (perceptron & Adaline from scratch, gradient descent) | Implement perceptron + Adaline in pure NumPy; plot the decision boundary and the cost curve |
| 6 | A tour of classifiers | ML Ch3 (logistic reg, SVM, KNN, trees in scikit-learn) · PS Ch5 (Naive Bayes, discriminant analysis, ROC/AUC) | Train & compare 5 classifiers on one dataset; build a confusion-matrix + ROC evaluation notebook |
| 7 | Project + week review | BE Ch2 (Naive Bayes movie recommender) | **PROJECT 1:** movie recommender shipped to GitHub; Week-1 self-quiz (30 questions); journal recap |

**Milestone:** you can explain bias, variance, sampling distributions, and a p-value without notes, and you have implemented a classifier from scratch.

---

## Week 2 — Classical ML mastery

**Focus:** The bread and butter of applied ML jobs — preprocessing, dimensionality reduction, disciplined evaluation, and the tree/ensemble family that wins most tabular problems. Four portfolio projects this week.

| Day | Theme & focus | Read + code (book · chapter) | Deliverable / practice |
|-----|---------------|------------------------------|------------------------|
| 8 | Data preprocessing | ML Ch4 (missing data, categorical encoding, scaling, feature selection, L1/L2 regularization) | A reusable sklearn preprocessing pipeline (ColumnTransformer + Pipeline) you can drop into any project |
| 9 | Dimensionality reduction | ML Ch5 (PCA, LDA, kernel PCA) · PS Ch7 (PCA section) | Notebook comparing PCA vs LDA vs t-SNE visualizations on one dataset; written intuition for each |
| 10 | Model evaluation & tuning | ML Ch6 (cross-validation, pipelines, grid/random search, learning & validation curves, metrics) | A full CV + GridSearchCV tuning workflow; a nested-CV example; a metrics cheat-sheet |
| 11 | Trees, forests & boosting | PS Ch6 (KNN, trees, bagging, random forest, XGBoost) · BE Ch3 (tree-based ad click-through) | **PROJECT 2a:** ad click-through — decision tree → random forest → XGBoost; feature-importance analysis |
| 12 | Ensembles & scalable models | ML Ch7 (voting, bagging, boosting) · BE Ch4 (logistic regression, SGD, online learning, big data) | **PROJECT 2b:** scalable logistic regression with SGD; compare against the Day 11 ensembles |
| 13 | Regression deep dive | ML Ch9 (linear, polynomial, tree regression) · PS Ch4 (regression, diagnostics, splines) · BE Ch5 (stock prices) | **PROJECT 3:** stock-price regression with residual diagnostics + regularization comparison |
| 14 | SVM, clustering & review | BE Ch9 (SVM face recognition) · ML Ch10 (k-means, hierarchical, DBSCAN) · PS Ch7 (clustering) | **PROJECT 4:** face recognition (SVM) + a clustering notebook; Week-2 review & interview drills |

**Milestone:** you can take a raw tabular dataset to a tuned, honestly-evaluated model — and defend every choice. Four projects now live on GitHub.

---

## Week 3 — Deep learning

**Focus:** Neural networks from the ground up, then fluency in PyTorch, then the two workhorse architectures — CNNs for images and RNNs for sequences. Use Colab/GPU on the heavier training days.

| Day | Theme & focus | Read + code (book · chapter) | Deliverable / practice |
|-----|---------------|------------------------------|------------------------|
| 15 | Neural nets from scratch | ML Ch11 (multilayer NN + backprop from scratch) · BE Ch6 (activation, feedforward, backprop) | Implement an MLP from scratch in NumPy and train it on an MNIST subset; log the loss curve |
| 16 | PyTorch essentials | ML Ch12 (tensors, autograd basics, GPUs, DataLoaders, building NNs in PyTorch) | Reimplement the MLP in PyTorch with a clean training loop + DataLoader; match your scratch accuracy |
| 17 | PyTorch mechanics | ML Ch13 (autograd, nn.Module, computation graphs, PyTorch Lightning) | Refactor into an object-oriented model + a Lightning version; save/load checkpoints |
| 18 | Convolutional networks | ML Ch14 (convolution, pooling, CNN architecture & implementation) | Build and train a CNN image classifier; visualize learned feature maps |
| 19 | CNN project | BE Ch11 (clothing images, data augmentation, transfer learning) | **PROJECT 5:** Fashion-MNIST CNN + transfer learning; beat a target accuracy and document ablations |
| 20 | Sequences & RNNs | ML Ch15 (RNN, LSTM, text generation) · BE Ch12 (sentiment, forecasting, text generation) | **PROJECT 6:** IMDb sentiment RNN + a character-level text generator |
| 21 | NLP, embeddings & review | ML Ch8 (sentiment / bag-of-words) · BE Ch7 (text analysis, embeddings, t-SNE) · BE Ch8 (topic modeling) | Newsgroups text-analysis + topic-model notebook; Week-3 review & deep-learning interview drills |

**Milestone:** you can design, train, debug, and evaluate a neural network in PyTorch for both image and text data — and explain backprop from memory.

---

## Week 4 — Modern AI, capstone & interview readiness

**Focus:** Transformers and generative/multimodal models, then a full pivot into a portfolio capstone and hard interview preparation. This is the week that makes you hireable, not just knowledgeable.

| Day | Theme & focus | Read + code (book · chapter) | Deliverable / practice |
|-----|---------------|------------------------------|------------------------|
| 22 | Transformers & attention | ML Ch16 (attention, the transformer, BERT, GPT) · BE Ch13 (BERT & GPT projects) | Fine-tune/apply BERT for sentiment; a GPT text-generation notebook using Hugging Face |
| 23 | Generative & multimodal | ML Ch17 (autoencoders, GANs) · BE Ch14 (CLIP image search, zero-shot classification) | **PROJECT 7:** a GAN on MNIST + a CLIP image-search demo |
| 24 | Graph NNs & reinforcement learning | ML Ch18 (graph neural networks) · ML Ch19 + BE Ch15 (Q-learning, deep Q, environments) | Q-learning agent on FrozenLake/Taxi; skim & run the GNN molecular demo |
| 25 | Best practices + capstone kickoff | BE Ch10 (21 ML best practices) · deployment/MLOps overview | Choose your **CAPSTONE**; write a one-page spec (problem, data, metric, plan); scaffold the repo |
| 26 | Capstone build I | Apply the full pipeline learned | End-to-end: data → EDA → clean baseline model → first honest evaluation |
| 27 | Capstone build II | Modeling + tuning + (optional) a deep-learning component | Iterate the model, tune rigorously, add a DL component if it fits; error analysis |
| 28 | Capstone finalize | Packaging & communication | README, results write-up, a simple demo (notebook, Streamlit, or small API); push to GitHub |
| 29 | Interview intensive | Targeted review across all three books | ML theory Q&A, coding drills, an ML system-design case; polish resume + portfolio |
| 30 | Mock interview & launch | Consolidation & delivery | Timed mock interview; fix weak spots; capstone presentation; a concrete job-application plan |

**Milestone:** a polished capstone plus seven supporting projects, and the ability to talk through any of them under interview pressure.

---

## Project portfolio

By Day 30 there are eight projects on GitHub. Employers hire on evidence, not certificates. Keep every repo clean: a clear README, a requirements file, and a short results section with at least one chart.

| # | Project | What it demonstrates | Source chapter |
|---|---------|----------------------|----------------|
| 1 | Movie recommender (Naive Bayes) | Classification fundamentals, probability, and model fine-tuning | BE ch2 |
| 2 | Ad click-through prediction | Trees, random forests, XGBoost, logistic regression at scale, feature importance | BE ch3–4 |
| 3 | Stock-price regression | Regression modeling, residual diagnostics, regularization, time-aware evaluation | BE ch5 |
| 4 | Face recognition + clustering | SVMs, multiclass classification, and unsupervised learning | BE ch9, ML ch10 |
| 5 | Fashion image CNN | Convolutional networks, data augmentation, transfer learning in PyTorch | BE ch11 |
| 6 | Sentiment + text generation (RNN) | Sequence modeling, LSTMs, and working with text data | ML ch15, BE ch12 |
| 7 | GAN + CLIP image search | Generative modeling and modern multimodal AI | ML ch17, BE ch14 |
| 8 | CAPSTONE (your choice) | End-to-end ownership: framing, building, evaluating, and communicating a real solution | — |

### Choosing your capstone (Day 25)

Pick something you can genuinely finish in three days and would enjoy talking about. Good capstones are specific, use a real dataset, and have a clear success metric:

- A tabular prediction problem end-to-end with a deployed demo (e.g., customer churn, loan default, house prices) — shows you can ship.
- An image classifier for a domain you care about, using transfer learning — shows deep-learning competence.
- An NLP app: a fine-tuned sentiment/classification model or a small retrieval + LLM demo — shows you are current.
- A Kaggle competition entry with a documented approach and leaderboard score — shows you can compete.

---

## Interview-prep track

Interview readiness is built in daily 1.5-hour doses, not crammed at the end. Each week the review block targets a theme so that by Week 4 you are polishing, not learning.

| Week | Interview theme | Prepare to answer / do |
|------|-----------------|------------------------|
| 1 | Statistics & fundamentals | Bias/variance, sampling, CLT, p-values, confidence intervals, correlation vs causation, when a result is "significant" |
| 2 | Classical ML & modeling | How each algorithm works, overfitting & regularization, cross-validation, metric choice, handling imbalanced data, feature engineering |
| 3 | Deep learning | Backprop, activation & loss functions, vanishing gradients, CNN vs RNN vs transformer, regularization (dropout, batchnorm), transfer learning |
| 4 | Applied & behavioral | ML system design, framing a problem, a coding drill a day, "walk me through a project", and behavioral (STAR) stories |

### Daily interview habits

- **Explain-aloud:** end every day by teaching the day's core idea to an imaginary interviewer in 2–3 minutes.
- **A coding rep a day:** one short Python/pandas/NumPy or ML-implementation problem (e.g., code k-means or a train/test split from scratch).
- **A flashcard deck:** add 3–5 cards daily (Anki or paper) for definitions and "why" questions; review the deck each morning.
- **Project talk-track:** for every project, write 4 sentences — problem, approach, result, what you'd do next.

---

## Job-readiness checklist

Being "job-ready" is this list, not a feeling.

- [ ] GitHub profile with 8 clean, documented project repos
- [ ] One polished capstone with a write-up and a runnable demo
- [ ] A resume tuned to Applied ML / Data roles, with projects front and center
- [ ] LinkedIn updated: headline, skills, and featured projects
- [ ] A 2–3 minute talk-track for every project, rehearsed out loud
- [ ] A flashcard deck covering stats, classical ML, and deep learning
- [ ] Comfort implementing core algorithms from scratch (k-means, logistic regression, a small NN)
- [ ] At least one timed mock interview completed and reviewed
- [ ] A shortlist of 15–20 target companies/roles and a weekly application cadence
- [ ] Optional but strong: a Kaggle competition entry or a published Kaggle notebook

---

## Staying on track

**If you fall behind.** Hard days are normal at this pace. Do not "make up" by skipping the build blocks; understanding compounds. Protect the core: prioritize the ML (spine) and BE (project) chapters, and treat the deepest PS sections as a second pass to revisit in Week 4's review. Better to deeply learn 80% than to skim 100%.

**If a day feels too easy.** Go deeper, not faster. Re-derive the math, break the code and fix it, or enter the relevant Kaggle competition for that technique. Depth is what interviews reward.

**Weekly reset.** Every Day 7/14/21/28, spend 30 minutes reviewing the journal, re-running flashcards, and adjusting the coming week. Momentum is the whole game.
