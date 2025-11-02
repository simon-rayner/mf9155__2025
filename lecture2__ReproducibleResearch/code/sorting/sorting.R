
source("/Users/simonray/UiO Dropbox/simon rayner/teaching/2023/Simon/lecture1__ReproducibleResearch/code/lab1filepaths.R")

quickSort <- function(arr) {
  
  # Pick a number at random
  random_index <- sample(seq_along(arr), 1);
  pivot <- arr[random_index]
  arr <- arr[-random_index]
  
  # Create array for left and right values.
  left <- c()
  right <- c()
  
  # Move all smaller and equal values to the
  # left and bigger values to the right.
  # compare element with pivot
  left<-arr[which(arr <= pivot)]
  right<-arr[which(arr > pivot)]
  
  if (length(left) > 1)
  {
    left <- quickSort(left)
  }
  if (length(right) > 1)
  {
    right <- quickSort(right)
  }
  
  # Return the sorted values.
  return(c(left, pivot, right))
}



selection_sort <- function(x)
{
  # length of array
  n <- length(x)
  for (i in 1 : (n - 1))
  {
    # assume element at i is minimum
    min_index <- i
    for (j in (i + 1) : (n))
    {
      # check if element at j is smaller
      # than element at min_index
      if (x[j] < x[min_index]) {
        # if yes, update min_index
        min_index = j
      }
    }
    # swap element at i with element at min_index
    temp <- x[i]
    x[i] <- x[min_index]
    x[min_index] <- temp
  }
  x
}





bubble_sort <- function(x)
{
  # calculate the length of array
  n <- length(x)
  # run loop n-1 times
  for (i in 1 : (n - 1)) {
    # run loop (n-i) times
    for (j in 1 : (n - i)) {
      # compare elements
      if (x[j] > x[j + 1]) {
        temp <- x[j]
        x[j] <- x[j + 1]
        x[j + 1] <- temp
      }
    }
  }
  x
}





library(microbenchmark)
set.seed(13)
arr10 <- sample(1:10, 10)
arr100 = sample(1:100, 100)
arr1000 = sample(1:1000, 1000)
arr10000 = sample(1:10000, 10000)
#arr100000 = sample(1:100000, 100000)


mbmR<- microbenchmark(
  quickSort(arr10),selection_sort(arr10),bubble_sort(arr10),
  quickSort(arr100),selection_sort(arr100),bubble_sort(arr100),
  quickSort(arr1000),selection_sort(arr1000),bubble_sort(arr1000),
  quickSort(arr10000),selection_sort(arr10000),bubble_sort(arr10000),
  times=50
)


library(readr)
mbmR
write_csv(mbmR, sort1000BenchmarkFilePathRScript)