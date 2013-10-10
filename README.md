Programming-Assignment-3-in-October-2013
========================================
Introduction
Download the le ProgAssignment3-data.zip le containing the data for Programming Assignment 3 from
the Coursera web site. Unzip the le in a directory that will serve as your working directory. When you
start up R make sure to change your working directory to the directory where you unzipped the data.
The data for this assignment come from the Hospital Compare web site (http://hospitalcompare.hhs.gov)
run by the U.S. Department of Health and Human Services. The purpose of the web site is to provide data and
information about the quality of care at over 4,000 Medicare-certied hospitals in the U.S. This dataset essentially covers all major U.S. hospitals. This dataset is used for a variety of purposes, including determining
whether hospitals should be ned for not providing high quality care to patients (see http://goo.gl/jAXFX
for some background on this particular topic)

Finding the best hospital in a state (best.r)
========================================
Write a function called best that take two arguments: the 2-character abbreviated name of a state and an
outcome name. The function reads the outcome-of-care-measures.csv le and returns a character vector
with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specied outcome
in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can
be one of "heart attack", "heart failure", or "pneumonia". Hospitals that do not have data on a particular
outcome should be excluded from the set of hospitals when deciding the rankings.
Handling ties. If there is a tie for the best hospital for a given outcome, then the hospital names should
be sorted in alphabetical order and the rst hospital in that set should be chosen (i.e. if hospitals "b", "c",
and "f" are tied for best, then hospital "b" should be returned).

Ranking hospitals by outcome in a state (rankhospital.r)
========================================
Write a function called rankhospital that takes three arguments: the 2-character abbreviated name of a
state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num).
The function reads the outcome-of-care-measures.csv le and returns a character vector with the name
of the hospital that has the ranking specied by the num argument. For example, the call
rankhospital("MD", "heart failure", 5) would return a character vector containing the name of the hospital with the 5th lowest 30-day death rate
for heart failure. The num argument can take values "best", "worst", or an integer indicating the ranking
(smaller numbers are better). If the number given by num is larger than the number of hospitals in that
state, then the function should return NA. Hospitals that do not have data on a particular outcome should
be excluded from the set of hospitals when deciding the rankings.
Handling ties. It may occur that multiple hospitals have the same 30-day mortality rate for a given cause
of death. In those cases ties should be broken by using the hospital name. For example, in Texas ("TX"),
the hospitals with lowest 30-day mortality rate for heart failure are shown here.

Ranking hospitals in all states (rankall.r)
========================================
Write a function called rankall that takes two arguments: an outcome name (outcome) and a hospital ranking (num). The function reads the outcome-of-care-measures.csv le and returns a 2-column data frame
containing the hospital in each state that has the ranking specied in num. For example the function call
rankall("heart attack", "best") would return a data frame containing the names of the hospitals that
are the best in their respective states for 30-day heart attack death rates. The function should return a value
for every state (some may be NA). The rst column in the data frame is named hospital, which contains
the hospital name, and the second column is named state, which contains the 2-character abbreviation for
the state name. Hospitals that do not have data on a particular outcome should be excluded from the set of
hospitals when deciding the rankings.
Handling ties. The rankall function should handle ties in the 30-day mortality rates in the same way
that the rankhospital function handles ties.
