# Shiny101

This is a collection of Projects created with Shiny, a web application framework for R.
Shiny makes it easy to create interactive web applications with using R code only.
More details about Shiny can be found [here](https://shiny.rstudio.com).

### Prerequisites
- In order to run these projects in your local environment, you need to have R and RStudio installed. If they are not installed already, install R [here](https://cran.r-project.org/bin/windows/base/) and RStudio [here](https://rstudio.com/products/rstudio/download/).
- You need to have "Shiny" installed as an R package.
```{r}
install.packages('shiny')
```
- It is recommended that you load Shiny before trying to run any of these projects.
```{r}
library(shiny)
```
### How to run
- Clone this repository.
- Open this project(Shiny101.Rproj) with RStudio.
- If you have loaded shiny already, type runApp() command with the name of the directory which contains the project that you want to run. Ex: If you want to run the Plot Random Values, you can simply type the following command in RStudio.
```{R}
runApp('Norm')
```
- If you have not loaded Shiny:
```{R}
shiny::runApp('Norm')
```

# Projects
## [1. Plot Random Numbers](Norm)

![Screenshot is not available right now.](Images/Norm.png)

This is a simple Shiny application to plot a normal distribution of random numbers.
The application is capable of dynamically changing its output(i.e. The plot) with the changes made to its parameters by the user via tweaking the controls.
6 controls are given to the user to adjust the plot.
1. Number of random numbers to be plotted. This should be a positive integer.
2. Minimum and maximum values for the x axis. The minimum value can be decreased upto -100 and the maximum value can be increased upto 100.
3. Minimum and maximum values for the y axis. The minimum value can be decreased upto -100 and the maximum value can be increased upto 100.
4. Toggle option to hide/show the label of x axis.
5. Toggle option to hide/show the label of y axis.
6. Toggle option to hide/show the label of the plot.
