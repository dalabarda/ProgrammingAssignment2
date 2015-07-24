## Put comments here that give an overall description of what your
## functions do

##  The function bellow store a list of functions

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x # get stores the matrix created 
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## The function bellow allows storing the processed data from the  previous function

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...) ## This line calculates the inverse of a square matrix
        x$setinverse(m) 
        m ## the invece of the matrix is cached here
}
## Return a matrix that is the inverse of 'mat'