## Below are two functions that are used to create a special "matrix" object 
## that stores a (numeric square) invertible matrix and cache's its inverse.

## This function creates a special "matrix", which is really a list containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse of matrix
## 4. get the value of the inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
    iM <- NULL
    set <- function(y){
        x <<- y
	iM <<- NULL
    }
    get <- function() x
    setInvertedMatrix <- function(invMatrix) iM <<- invMatrix
    getInvertedMatrix <- function() iM
    list(set = set, get = get,
         setInvertedMatrix = setInvertedMatrix,
	 getInvertedMatrix = getInvertedMatrix)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    iM <- x$getInvertedMatrix()
    if(!is.null(iM)) {
        message("getting cached data")
        return(iM)
    }
    data <- x$get()
    iM <- solve(data, ...)
    x$setInvertedMatrix(iM)
    iM
}
