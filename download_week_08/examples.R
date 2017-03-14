# Example 10.6 on pages 509 and 510 of Ott

# Grand Rapids
n1 <- 608
s1 <- 392
f1 <- n1-s1 # number of failures

# Wichita
n2 <- 527
s2 <- 413
f2 <- n2-s2 # number of failures

# Matrix with successes in first column, failures in second column
# either of these would work

m <- matrix( c(s1,s2,f1,f2), nrow = 2)
m <- rbind( c(s1,f1), c(s2,f2) )

# make a 95% CI for the difference of proportions as on page 509
# if you do stats::prop.test() that just insures that we are using the 
# default command in the package stats, this is only necessary if you load 
# another package that implements prop.test (such as MOSAIC), otherwise, you can 
# use prop.test().  Typing stats::prop.test() doesn't hurt anything.

prop.test(m,conf.level=.95)$conf.int

# the CI gives negative differences because we specified the two samples in the 
# opposite order from the book
#
# also, the CI is slightly different because R computes a Wilson adjusted interval that is more accurate.
# the one proportion version of this interval is here:
# https://en.wikipedia.org/wiki/Binomial_proportion_confidence_interval

# if we want to estimate the proportion aware in Grand Rapids (a one proportion interval)
prop.test(s1,n1,conf.level=.95)$conf.int

# for a chi-square test is doesn't matter which way the table is oriented
mtranspose <- t(m)  # transpose the matrix
m
mtranspose
chisq.test(m)
chisq.test(mtranspose)


# several of the questions in the homework are to compute proportions/probabilities from the data

# what proportion of grand rapids residents are aware?
s1/n1

# what proportion of aware people live in Wichita?
#
# (number of aware in W)/(total # aware)
s2 / (s2 + n2)


