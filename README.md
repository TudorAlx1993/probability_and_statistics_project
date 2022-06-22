# Statistics and Probability Theory Project

Team members: 
  * Tudor-Alexandru Alexandrescu
  * Radu Andrei Dumitru
  * Raluca Brinceanu
  * Robert Samata

Project coordinator: Tudor-Alexandru Alexandrescu

This web application, built using the Shiny package for R, allows for a number of operations related to discrete or continuous random variables.
The project is split into 10 sections:
 * **Analysis of numerical data imported through a CSV file**: outputs statistics summary (median, mean, quartiles), histogram and boxplot
 * **View discrete or continuous probability distribution**: choose a probability distribution and input parameters, and the page will output a short description of the distribution in Romanian, plots relating to its PDF/PMF and CMF, and other characteristics
 * **Analysis of joint distribution**: input a joint distribution X,Y through 3 csv files representing values of X, values of Y and probabilities of joint distribution respectively. The page will output a plot for each of the marginal distributions, along with their estimated values/dispersions and covariance + correlation coefficient of X,Y
 * **Work with events**: input probabilities of 2 events A and B, and select whether they are independent, incompatible or their relationship is unknown, in which case P(A∩B) will also be input. Page will output P(A∩B), P(A∪B), P(A|B) and P(B|A)
 * **Plot discrete random variable**: import a discrete random variable through a CSV file, and select a starting position from which to view it. The page will plot the contents of the variable, starting from the desired position
 * **Implementation of the P function from discreteRV**: for a selected distribution with given parameters and a selected probability, calculates said probability for the distribution
 * **Operations on discrete random variables**: add, substract, multiply or divide two imported discrete random variables
 * **Transformation of discrete random variable**: plots the result of an input transformation function applied on an imported discrete random variable
 * **Transformation of joint random variable distribution**: given an imported joint distribution X,Y and two transformation functions g() and h(), outputs the joint distribution of g(X) and h(Y)
 * **Calculate mean and variance of g(X)**: given a discrete or continuous random variable X with a selected distribution and input parameters, along with an input transformation function g(), calculates mean and variance of g(X)

Project structure:
  * `./src` contains the source code
    * `main.R` is the file used to start up the application
    * various directories used to organize different sections of the project
  * `./inputs` contains various input .csv data files

This project was built for our Statistics and Probability Theory course at the Faculty of Mathematics and Computer Science, University of Bucharest.
