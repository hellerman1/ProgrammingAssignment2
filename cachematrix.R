

## These functions creates a special "matrix" 
##object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) { 
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
        get <- function() x
            setInverse <- function(inverse) inv <<- inverse
            getInverse <- function() inv
        list(set = set,
             get = get,
             setInverse = setInverse,
              getInverse = getInverse)

}


## The following function calculates the inverse matrix of the special
##"vector" created with the above function and retrieve the inverse 
##from the cache.  Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
        
  inv <- x$getInverse()
        if (!is.null(inv)) {
            
            return(inv)
  }
  mat <- x$get()
       inv <- solve(mat, ...)
        x$setInverse(inv)
        inv
}

