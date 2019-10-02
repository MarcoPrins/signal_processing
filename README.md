# Signal processing app

## Definition of done
* Frontend mockups showing a **conceptual** version of what the UI would look like (See below under **User Interface Mockups**).
* Backend endpoints that would be needed for such a mockup, **fully implemented**

## Things to note
* All the relevant files for this project are in the **models** and **controllers** directores (as well as **spec/models** and **spec/controllers**). The rest is just boilerplate code!
* For this assignment I only focussed on the feature described - This app does not have things like valid authentication etc.

## Running the container locally

Assuming you have docker installed, you can clone this repository, run `docker-compose build` and then run `rake db:setup` in the container. You should then be able to run the container using `docker-compose up`.

## Description of implementation
* A recording of data - such as the data in the example provided, is saved in the database as a `DataCapture`
* You can add an analysis of the data - which you can save if you want. This is called a `DataAnalysis`. There can be different types of data analysis. The analysis described in the example (1 if a threshold is exceeded otherwise 0) would be an example of this, and the type for this would be `ThresholdCompliance`.
* I have added an extra example of a data analysis called `Delta` which will show the difference between a data entry and the one before it. This is just to show how the inheritance works and how the app can be scaled with different types of data analyses.
* A data analysis can be computed and previewed through the `preview` endpoint, and persisted through the `create` endpoint.

## User interface mockups

1. A data capture, which would presumably be created by lab equipment, is saved as a database record and can be viewed as shown here. There is a button with which you add a data analysis.

![Mockup 1](https://img.techpowerup.org/191002/mockup-1.png)

2. When you click the button to add a data analysis, it opens up a form where you can choose the type and configure any necessary parameters (such as threshold, for a `ThresholdCompliance`)

![Mockup 2](https://img.techpowerup.org/191002/mockup-2.png)

3. You can click preview to see what the data analysis would look like without saving it. This will use the `preview` endpoint.

![Mockup 3](https://img.techpowerup.org/191002/mockup-3.png)

4. If you click Add, it will save this data analysis. It now displays below the actual data capture.

![Mockup 4](https://img.techpowerup.org/191002/mockup-4.png)

5. If you want to view data in detail, you can drag and select a subset of data on the data capture graph. This will reveal a table with the exact data figures, for the data capture as well as all analyses. (It's done this way because the complete data capture will likely be too big to view in a table as a whole - so only when you select a subset it will reveal the values).

![Mockup 5](https://img.techpowerup.org/191002/mockup-5.png)

6. Also, if you preview a data analysis while in this "focus" mode, it will show a preview of your data analysis that you're configuring.

![Mockup 6](https://img.techpowerup.org/191002/mockup-6.png)
