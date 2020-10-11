## This is a file for a function which invert a matrix and stores the result in cache
## instead of doing it from scratch on each call
## The file contains two functions, one which holds the matrix object and the invertible matrix if calculated before,
## and the second one, calculates the invertible matrix

## this function initiate the matrix object and stores its invertible matrix in list


makeCacheMatrix <- function(x = matrix()) {
  invert <- NULL
  set <- function(y) {
    x <<- y
    invert <<- NULL
  }
  get <- function() x
  setinvert <- function(solve) invert<<- solve
  getinvert <- function() invert 
  list(set = set, get = get,
       setinvert = setinvert,
       getinvert = getinvert)
}


## This function checks if there is a calculated invertible matrix and return it, and if not it does calculate it 

cacheSolve <- function(x, ...) {
  invert <- x$getinvert()
  if(!is.null(invert)) {
    message("getting cached data")
    return(invert)
  }
  data <- x$get()
## Here we're testing the matrix if it's invertible to prevent R from throwing an ERROR.
  test <- try(solve(m),silent=T)
  if(is.na(as.logical(test))){
    message("The matrix is not invertible")
    return(x$get())
  }
  invert <- solve(data, ...)
  x$setinvert(invert)
  invert 
        ## Return a matrix that is the inverse of 'x'
}
