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

## Example of adding a norm

Load the `RobotForager` model by selecting `Cormas > Models in this image` from the top menu.
Open SystemBrowser and navigate into the `RobotForager-Model` package.
Create a new subclass of `CMNorm` called `RFRobotMustNotApproachOtherRobot`.

```st
CMNorm << #RFRobotMustNotApproachOtherRobot
	slots: {};
	package: 'RobotForager-Model'
```

In that class, define an `action` method specifying the method that will be instrumented:

```st
action

	^ self methodFor: #step in: RFRobot
```

Specify a condition - in this case, at least one cell in the neighbourhood contains another robot:

```st
condition: agent

	^ agent cell neighbourhood anySatisfy: [ :c | c hasOccupantsOfClass: RFRobot ]
```

Define a consequence - in this case, robot dies

```st
consequence: agent

	^ agent die
```

So if a robot comes too close to another robot, it dies.

Open a simulation browser: `Cormas > Models in this image`, select Robot forager and click on `Simulate`.
Click on the first button in the left toolbar and initialize a model using the `initSmallHexagon` init method and `step` control method (it's very important to use `step` because we have instrumented it.

<img width="996" height="597" alt="image" src="https://github.com/user-attachments/assets/f26a30d4-df19-43ea-9b6a-1f2c8c95c7d0" />

Click on the last button in the left toolbar. Apply the norm.

<img width="996" height="597" alt="image" src="https://github.com/user-attachments/assets/0ff2952c-4db0-4afe-91ce-563dceaa7967" />

Then run several steps of the simulation. One robot should die as it approaches the other one


