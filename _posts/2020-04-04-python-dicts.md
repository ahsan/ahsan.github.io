---
layout: post
title: Making copies of Python dictionaries
---

Copying `dictionaries` in Python is easy, but with a few gotchas in special cases.

Dictionaries with _immutable_ values can be copied simply by passing  as arguments to the `dict()` constructor method. Immutable types in Python are `int`, `float`, `decimal`, `bool`, `str`, `tuple`, and `range`. 

Example:
```python
original_dict = dict({'foo': 'bar', 'fizz': ('fuzz', 'buzz')})
copied_dict = dict(original_dict)
```

That was easy. Now comes the more interesting part. In the case that the source dictionary has one or more _mutable_ values, copying requires more caution depending on the desired behavior. Mutable types in Python are `list`, `dictionary`, `set`, and user-defined `classes`. Using the constructor `dict()` as above, will only produce a shallow copy of the source dictionary. This means that the corresponding values of each dictionary are the same object and have the same `id`. Changing the value of copied dict will be reflected in the original dict as well, since it's the same underlying object being shared between the dictionaries.

```python
original_dict = dict({'foo': ['bar', 'fuzz']})
shallow_copy = dict(original_dict)
id(original_dict['foo']) == id(shallow_copy['foo'])
```

In order to make a deep-copy of dictionaries with mutable values, Python provides a `copy` module which has the `deepcopy` method.

```python
from copy import deepcopy
original_dict = dict({'foo': ['bar', 'fuzz']})
deep_copy = deepcopy(original_dict)
id(original_dict['foo']) == id(deep_copy['foo'])
```

Now you know how copying of dictionaries works in Python, and can avoid making the mistakes I made. 🙂