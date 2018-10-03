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

first3Primes = take 3 primes

removedPrimes = drop 3 primes

is7inList = 7 `elem` primes
-- 

