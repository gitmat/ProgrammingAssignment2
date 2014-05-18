## Put comments here that give an overall description of what your
## functions do

## You can test it with the following code:
## m <- rbind(c(2,3), c(2,2))
## mc <- makeCacheMatrix(m)
## cacheSolve(mc)
## cacheSolve(mc)
## The second call to 'cachesolve' will not prompt a message about computing the inverse

## Write a short comment describing this function
# Much like the makeVector example,
# this is a wrapper for a matrix and a cached inverse matrix
makeCacheMatrix <- function(x = matrix()) {
  # i, the inverse matrix
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Write a short comment describing this function
# In similar fashion to cachemean example,
# returns the cached inverse when available
cacheSolve <- function(x) {
  i <- x$getinverse()
  if(is.null(i)) {
    message("inverse matrix wasn't cached, computing it")
    data <- x$get()
    i <- solve(data)
    x$setinverse(i)
  }
  ## Return a matrix that is the inverse of 'x'
  i
}