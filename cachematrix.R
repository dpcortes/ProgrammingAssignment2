## Put comments here that give an overall description of what your
## functions do
## Write a short comment describing this function

## As in makeVector, makeCacheMatrix has four functions
## set, get, setmatrix and getmatrix.
## get returns the matrix stored in the main function
## So, I asign the funtions list to a
## I create a matrix to work with, make sure it has an inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  m  <-NULL
  set<-function(y){
    x<<- y
    m<<- NULL
  }
  get<-function() x
  setmatrix <- function(solve) m <<- solve
  getmatrix <- function() m
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)
}

a <- makeCacheMatrix(x)
x = c(1,2,3,2,-1,1,5,2,1)
dim(x) <- c(3,3)

b <- a$get()
b

solve(b)

## regarding set function, it changes the matrix stored in main function
## to use it I created another matrix z (also invertble) and asign it to a
## and make sure it has an inverse

z <- c(2, 4, 3, 7, 12, 11, -3, -5, 9)
dim(z) <- c(3,3)
a$set(z)
a$get()
solve(z)

## funtions setmatrix and getmatrix works much the same as in makeVector
## I created another matrix g to be stored in the main function makeCacheMatrix
## by using a$setmatrix
## and calling it by using a$getmatrix without any argument
## then, check for the inverse matrix existance

g <- c(3, 4, 12, 10, 4, 6, 7, 9, 2)
dim(g) <- c(3, 3)

a$setmatrix(g)
a$getmatrix()

d <- a$getmatrix()
solve(d)

## This function returns the inverse of the matrix stored in the main function
## set by the function setmatrix

cacheSolve <- function(x=matrix(), ...) {
  m<-a$getmatrix()
  if(!is.null(m)){
    message("getting cached data")
    solve(m)
  }
}




