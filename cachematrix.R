## This program creates a special matrix for which a cache of inverse is stored with it and is calculated for the first time 
## and then after that the caluated value is stored somewhere and that is returned when called again

##The following function creates a special vector that contains a list of functions. 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
  
  

}

## The function below returns the inverse of the special matrix. 
##It returns the value directly if the the inverse has been calculated for the matrix already.

cacheSolve <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setmean(m)
  m
        ## Return a matrix that is the inverse of 'x'
}
