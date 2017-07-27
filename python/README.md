# Libraries for Data Science

## Basic Libraries for Data Science

These are the basic libraries that transform Python from a general purpose programming language into a powerful and robust tool for data analysis and visualization. Sometimes called the SciPy Stack, they’re the foundation that the more specialized tools are built on.

* NumPy is the foundational library for scientific computing in Python, and many of the libraries on this list use NumPy arrays as their basic inputs and outputs. In short, NumPy introduces objects for multidimensional arrays and matrices, as well as routines that allow developers to perform advanced mathematical and statistical functions on those arrays with as little code as possible.
* SciPy builds on NumPy by adding a collection of algorithms and high-level commands for manipulating and visualizing data. This package includes functions for computing integrals numerically, solving differential equations, optimization, and more.
* Pandas adds data structures and tools that are designed for practical data analysis in finance, statistics, social sciences, and engineering. Pandas works well with incomplete, messy, and unlabeled data (i.e., the kind of data you’re likely to encounter in the real world), and provides tools for shaping, merging, reshaping, and slicing datasets.
* IPython extends the functionality of Python’s interactive interpreter with a souped-up interactive shell that adds introspection, rich media, shell syntax, tab completion, and command history retrieval. It also acts as an embeddable interpreter for your programs that can be really useful for debugging. If you’ve ever used Mathematica or MATLAB, you should feel comfortable with IPython.
* matplotlib is the standard Python library for creating 2D plots and graphs. It’s pretty low-level, meaning it requires more commands to generate nice-looking graphs and figures than with some more advanced libraries. However, the flip side of that is flexibility. With enough commands, you can make just about any kind of graph you want with matplotlib.


##Libraries for Machine Learning
Machine learning sits at the intersection of Artificial Intelligence and statistical analysis. By training computers with sets of real-world data, we’re able to create algorithms that make more accurate and sophisticated predictions, whether we’re talking about getting better driving directions or building computers that can identify landmarks just from looking at pictures. The following libraries give Python the ability to tackle a number of machine learning tasks, from performing basic regressions to training complex neural networks.

* scikit-learn builds on NumPy and SciPy by adding a set of algorithms for common machine learning and data mining tasks, including clustering, regression, and classification. As a library, scikit-learn has a lot going for it. Its tools are well-documented and its contributors include many machine learning experts. What’s more, it’s a very curated library, meaning developers won’t have to choose between different versions of the same algorithm. Its power and ease of use make it popular with a lot of data-heavy startups, including Evernote, OKCupid, Spotify, and Birchbox.
* Theano uses NumPy-like syntax to optimize and evaluate mathematical expressions. What sets Theano apart is that it takes advantage of the computer’s GPU in order to make data-intensive calculations up to 100x faster than the CPU alone. Theano’s speed makes it especially valuable for deep learning and other computationally complex tasks.
* TensorFlow is another high-profile entrant into machine learning, developed by Google as an open-source successor to DistBelief, their previous framework for training neural networks. TensorFlow uses a system of multi-layered nodes that allow you to quickly set up, train, and deploy artificial neural networks with large datasets. It’s what allows Google to identify objects in photos or understand spoken words in its voice-recognition app.

##Libraries for Data Mining and Natural Language Processing

What if your business doesn’t have the luxury of accessing massive datasets? For many businesses, the data they need isn’t something that can be passively gathered—it has to be extracted either from documents or webpages. The following tools are designed for a variety of related tasks, from mining valuable information from websites to turning natural language into data you can use.

* Scrapy is an aptly named library for creating spider bots to systematically crawl the web and extract structured data like prices, contact info, and URLs. Originally designed for web scraping, Scrapy can also extract data from APIs.
* NLTK is a set of libraries designed for Natural Language Processing (NLP). NLTK’s basic functions allow you to tag text, identify named entities, and display parse trees, which are like sentence diagrams that reveal parts of speech and dependencies. From there, you can do more complicated things like sentiment analysis and automatic summarization. It also comes with an entire book’s worth of material about analyzing text with NLTK.
* Pattern combines the functionality of Scrapy and NLTK in a massive library designed to serve as an out-of-the-box solution for web mining, NLP, machine learning, and network analysis. Its tools include a web crawler; APIs for Google, Twitter, and Wikipedia; and text-analysis algorithms like parse trees and sentiment analysis that can be performed with just a few lines of code.



##Libraries for Plotting and Visualizations

The best and most sophisticated analysis is meaningless if you can’t communicate it to other people. These libraries build on matplotlib to enable you to easily create more visually compelling and sophisticated graphs, charts, and maps, no matter what kind of analysis you’re trying to do.

* Seaborn is a popular visualization library that builds on matplotlib’s foundation. The first thing you’ll notice about Seaborn is that its default styles are much more sophisticated than matplotlib’s. Beyond that, Seaborn is a higher-level library, meaning it’s easier to generate certain kinds of plots, including heat maps, time series, and violin plots.
* Bokeh makes interactive, zoomable plots in modern web browsers using JavaScript widgets. Another nice feature of Bokeh is that it comes with three levels of interface, from high-level abstractions that allow you to quickly generate complex plots, to a low-level view that offers maximum flexibility to app developers.
* Basemap adds support for simple maps to matplotlib by taking matplotlib’s coordinates and applying them to more than 25 different projections. The library Folium further builds on Basemap and allows for the creation of interactive web maps, similar to the JavaScript widgets created by Bokeh.
* NetworkX allows you to create and analyze graphs and networks. It’s designed to work with both standard and nonstandard data formats, which makes it especially efficient and scalable. All this makes NetworkX especially well suited to analyzing complex social networks.

## conda vs. pip vs. virtualenv

https://conda.io/docs/_downloads/conda-pip-virtualenv-translator.html





#### Ref:
Inspired by the works from:

* https://www.upwork.com/hiring/data/15-python-libraries-data-science/