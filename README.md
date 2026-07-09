# Cormas Norms

A plugin extending Cormas with norms

```st
"First install Cormas"
Metacello new
    repository: 'github://cormas/cormas';
    baseline: 'Cormas';
    load.

"Then install the norms plugin"
Metacello new
    repository: 'github://cormas/cormas-norms:main';
    baseline: 'CormasNorms';
    load.
```

Check the examples of norms in package `Cormas-Norms-Examples`.
