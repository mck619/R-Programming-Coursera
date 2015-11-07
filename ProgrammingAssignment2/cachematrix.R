## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
	inverse <- NULL
	set <- function(y){
		x <<- y
		inverse <<- NULL
	}
	get <- function() x
	setinverse <- function(i) inverse <<- i
	getinverse <- function() inverse
	list(set = set, get = get, setinverse = setinverse, 
<<<<<<< HEAD
	     getinverse = getinverse) 
=======
	     getinverse = get inverse) 
>>>>>>> R-Programming-Coursera/master

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {

        ## Return a matrix that is the inverse of 'x'

	inverse <- x$getinverse()
	if(!is.null(inverse)){
		message("getting cached data")
<<<<<<< HEAD
		return(inverse)
	}
	matrix <- x$get()
	inverse <-solve(matrix)
=======
		return inverse
	}
	matrix <- x$get()
	inverse <-solve(data)
>>>>>>> R-Programming-Coursera/master
	x$setinverse(inverse)
	inverse
}
