Individual homework 4
================

## Please push your assignment to GitHub by 10:00 pm (Central) Monday, Apr 22.

You are currently in the GitHub repository (repo) for `hw4-username`.
The assignment prompt is shown below (i.e. in `README.Rmd`). You can
view this online in your homework 4 GitHub repository as a Markdown
file(`README.md`) or a pdf.

Please **use `hw4.Rmd` to complete this assignment**. Be sure to **knit
your file to PDF before your final push to GitHub**.

## Homework process

For help on the homework process, review

- [Assignments in Stat
  220](https://stat220-spring24.netlify.app/assignments) for
  content/formatting questions.

- [GitHub Guide for Students in Stat
  220](https://stat220-spring24.netlify.app/github_tutorial) for Git and
  Github instructions.

When you are done with your homework, **don’t forget to push your
changes to ALL files back to GitHub!** This means you should commit and
push all related files, not just your final PDF. Additionally, ensure
you post the link to your **GitHub repository to Gradescope for the
final submission and grading**. This step is crucial as it allows for a
comprehensive review of both your code and the rendered output.

------------------------------------------------------------------------

## Assignment prompt

## Problem 1: flights

Use the `flights` data frame from the `nycflights13` package to answer
the questions below. (see help `?nycflights13::flights` for more
details) Use `dplyr` to answer the questions below.

### a.

What plane (by `tailnum`) traveled the most times from NYC airports in
2013?

### b.

Load the `lubridate` package, then add a labeled month variable called
`mth` using the command `mth = month(time_hour, label = TRUE)`. Then
compute the number of flights from NYC airports for each day in 2013 and
create a boxplot (in `ggplot2`) of number of flights per day by month
(using `mth`). Which time of the year tends to see the most flights from
NYC?

### c.

Use the `lubridate` package to add a labeled day of the week variable
called `dow` using the command `dow = wday(time_hour, label = TRUE)`.
Then compute the number of flights from NYC airports for each day in
2013 and create a boxplot (in `ggplot2`) of number of flights per day by
day of the week. Which day of the week sees the fewest flights from NYC?

## Problem 2: top destinations

More with the `nycflights13` data. Consider `top_dest`, the top 10
destinations out of NYC area in 2013:

``` r
top_dest <- flights %>% 
  count(dest) %>% 
  slice_max(n, n = 10)
```

### a.

Use a `dplyr` filtering join command to create a `flights` data subset
that only contains destinations in the `top_dest` top 10 destinations.
What is the dimension of this data set?

### b.

Use your joined data from (a) to compute the median number of minutes
between flights to each destination. Hint: Use the `make_datetime`
function to convert the scheduled departure date/time
(year,month,day,hour,minute) to a date/time variable, then use either
the `difftime` or `interval` and `int_length` function to compute the
number of minutes between scheduled departures for each destination.
(Note that we can’t use the `time_hour` variable because it doesn’t have
a minute measure in it.)

## Problem 3: Energy

The energy dataset `EnergyData1516.csv` gives energy use (kiloWatt hour)
every 15 minutes for the 15-16 academic year for all buildings on campus
that have an energy meter installed.

Read the energy data in again using the `read_csv` command below that
specifies column type for `Timestamp` and `dayWeek` and defaults to
double types for all other. The order of the factor levels of `dayWeek`
are also given so we get days ordered correctly in plots. Note that you
will need to wrap a variable name in backticks if it starts with a
non-letter character. See the `glimpse` command below for an example.

``` r
energy <- readr::read_csv("https://raw.githubusercontent.com/deepbas/statdatasets/main/energy.csv",
                    col_type = cols(
                     .default = col_double(), 
                      Timestamp = col_datetime(format = ""),
                      dayWeek = col_factor(levels=c("Mon","Tues","Wed","Thurs","Fri","Sat","Sun"))
                     ))
dim(energy)
```

### a.

Create a tidy version of the `energy` data called `energy_narrow` that
puts building names in a column called `building` and energy values into
a column called `energyKWH`. The chunk below gives you a start to this
task. Check that your `energy_narrow` data frame contains 2,880,578 rows
and 10 columns.

``` r
names(energy)  # check variable names for use in pivot
energy_narrow <- energy %>% 
  pivot_xxxx(
    # fill in 3 arguments #
  )
```

### b.

Use `lubridate` to convert the `Timestamp` to a `date` variable (just
date, no time). Hint: use `date()`. Then use this new date variable to
create a new data set that contains the daily mean and standard
deviation of energy use for Laird Hall.

### c.

Create a time series (line) graph of mean daily energy use for Laird
Hall with the following features:

- a black line geometry to show mean daily energy use by day
- has ribbon geometry layer with limits that are one standard deviation
  above and below the mean energy use. Checking `?geom_ribbon` would be
  useful.
- in the ribbon geom, use a fill color to denote month with a
  transparency of 0.5

Describe the trends observed for both mean usage and SD of usage.

### d. 

Martha Larson says that the Laird energy meter was adjusted in April
2016 because it was reading too high. Use the drop in daily usage to
determine what day in April this adjustment occurred.

### e.

Martha says the higher readings in Laird are due to an incorrect meter
that was reading too high. To correct these “too high” readings, we need
to multiply them by a factor of 0.16. Do this to get “corrected” average
and SD daily readings (for this time period), then replot the graph from
part (b). Does this correction to the pre-April correction readings seem
to bring the “too high” readings back in line with the post-April
correction readings?

------------------------------------------------------------------------

## Problem 3: UN votes

``` r
unvotes <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-23/unvotes.csv')
roll_calls <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-23/roll_calls.csv')
issues <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-23/issues.csv')
```

``` r
# Merge data frames
merged_data <- unvotes %>%
  left_join(roll_calls, by = "rcid", multiple = "all") %>%
  left_join(issues, by = "rcid", multiple = "all") %>% 
  tidyr::drop_na(country, country_code, vote, issue, date) %>% 
  mutate(vote = factor(vote))
```

### a.

The ‘vote’ column has been converted to a factor. Change the levels of
the ‘vote’ column to follow the order: “yes”, “no”, “abstain”.

### b.

Recode the ‘issue’ column into a new ‘issue_category’ column with the
following categories: “Territorial Issues”, “Weapons and Disarmament”,
“Human Rights”, and “Economic Development”. Create a stacked bar plot
showing the vote shares by issue category.

### c. 

Relevel the ‘issue_category’ variable to follow the order: “Territorial
Issues”, “Weapons and Disarmament”, “Human Rights”, “Economic
Development”. Create a bar plot showing the vote counts by issue
category using this new order.

### d.

Reorder countries based on the frequency of ‘no’ votes. Create a bar
plot showing the top 10 countries with the highest number of ‘no’ votes.

### e.

Use `fct_collapse()` to create a new variable called ‘region’ by
grouping countries into the following regions: “Americas”, “Europe”,
“Asia”, and “Middle East”.

- Americas: “United States”, “Canada”, “Brazil”, “Argentina”, “Mexico”
- Europe: “United Kingdom”, “France”, “Germany”, “Italy”, “Spain”
- Asia: “China”, “Japan”, “India”, “South Korea”, “Russia”
- Middle East: “Iran”, “Israel”, “Saudi Arabia”, “Turkey”, “United Arab
  Emirates”
