import Data.List
import System.IO

maxInt = maxBound :: Int
minInt = minBound :: Int

sumOfNums = sum [1..1000]

addEx = 5 + 4

favNums = 2 : 7 : 21 : 66 : []


-- 
primes = 2 : 3 : 5 : 7

lenPrime = length primes

revPrime = reverse primes

isListEmpty = null primes

-- Access index
secondPrime = primes !! 1

firstPrime = head primes
lastPrime = last primes

-- Returns everything but the last
primitInit = init primes
-- 


first3Primes = take 3 primes

removedPrimes = drop 3 primes

is7inList = 7 `elem` primes

-- Takes first 10 of array.Returns [1, 2, 3, 4, 5, 1, 2, 3, 4, 5]
cycleList = take 10 (cycle [1, 2, 3, 4, 5])

-- Take x from list 1 to 10 and multiply by 2
listTimes2 = [x * 2 | x <- [1..10]]


-- Take x from list 1 to 10 and multiply by 2. Only pick x based on filter
listTimes2 = [x * 2 | x <- [1..10], x*3 <= 50]

sumOfLists = zipWith (+) [1, 2, 3, 4, 5] [6, 7, 8, 9, 10]

listBiggerThan5 = filter (>5) primes

evensUpTo20 = takeWhile (<= 20) [2,4..]


-- List comprehension

powList = [3^n | n <- [1..10]]

multTable = [[x* y | y<- [1..10]] | x<- [1..10]]