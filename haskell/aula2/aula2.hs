{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use foldl" #-}

{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use foldl" #-}
import Data.Char ( chr, ord, isAsciiUpper, isNumber, isAsciiLower)

--ex 2.1
--a)

myand :: [Bool]->Bool

myand [] = True
myand l
    | head l = myand (tail l)
    | not (head l) = False

myand' :: [Bool]->Bool

myand' l = myand'Aux l True

myand'Aux :: [Bool]->Bool->Bool

myand'Aux [] acc = acc
myand'Aux (x:xs) acc = myand'Aux xs (acc && x)


--b)

myor :: [Bool]->Bool

myor [] = False
myor l
    | head l = True
    | not (head l) = myor (tail l)


--c)
myconcat :: [[a]]->[a]

myconcat [] = []
myconcat (h:t) = h ++ (myconcat t)

myconcat' :: [[a]]->[a]

myconcat' l = [x | xs <- l, x <- xs]

--d)
myreplicate :: Integral a => a -> b -> [b]

myreplicate 0 _ = []
myreplicate n x
    | n > 0 = x:(myreplicate (n-1) x)
    | n < 0 = error "inteiro negativo"

myreplicate' :: Integral a => a -> b -> [b]

myreplicate' n x = [x | _ <- [1..n]]

--e)

(@@) :: Integral b => [a] -> b -> a

[] @@ _ = error "lista vazia"
(x:_) @@ 0 = x
(_:xs) @@ n
    | n > 0 = xs @@ (n-1)
    |otherwise = error "argumento inteiro negativo"


(@@@) :: Integral b => [a] -> b -> a

l @@@ n = head [x | (x,i) <- zip l [0..], i == n]


--f)

myelem :: Eq a => a -> [a] -> Bool

myelem _ [] = False
myelem n (x:xs)
    | x == n = True
    | otherwise = myelem n xs
--extra

myreverse :: [a] -> [a]

myreverse [] = []
myreverse (x:xs) = (myreverse xs) ++ [x]

myreverse' :: [a] -> [a]

myreverse' l = myreverse'Aux l []

myreverse'Aux :: [a] -> [a] -> [a]

myreverse'Aux [] acc = acc
myreverse'Aux (x:xs) acc = myreverse'Aux xs (x:acc)

--ex 2.2
interperse :: a -> [a] -> [a]

interperse _ [] = []
interperse _ [x] = [x]
interperse a (x:xs) = x:a:(interperse a xs)

--ex 2.3
mdc :: Integer -> Integer -> Integer

mdc a 0 = a
mdc a b = mdc b (mod a b)

--ex 2.4
--a)
insert :: Ord a => a -> [a] -> [a]

insert a [] = [a]
insert a (x:xs)
    | x > a = a:x:xs
    |otherwise = x:(insert a xs)

--b)
isort :: Ord a => [a] -> [a]

isort [] = []

isort (x:xs) = insert x (isort xs)


--ex 2.5 
--a)
minimum' :: Ord a => [a] -> a

minimum' [x] = x
minimum' (x:xs)
    | x < minimum' xs = x
    | otherwise = minimum' xs

--b)
delete :: Eq a => a -> [a] -> [a]

delete a [] = []
delete a (x:xs)
    | x == a = xs
    | otherwise = x:(delete a xs)

--c)
ssort :: Ord a => [a] -> [a]

ssort [] = []
ssort l = m:(ssort (delete m l))
    where m = minimum' l

--ex 2.6
squaresum :: Integral a => a -> a

squaresum n = sum [x^2 | x <- [1 .. n]]

--ex 2.7
--a)
aprox :: Int -> Double

aprox n = sum [fromIntegral((-1)^x) / fromIntegral ((2*x + 1)) | x <- [0 .. n]] * 4

--b)
aprox' :: Int -> Double

aprox' n = sqrt (sum [fromIntegral ((-1)^x) / fromIntegral ((x + 1)^2) | x <- [0 .. n]] * 12)

--ex 2.8

dotprod :: [Float] -> [Float] -> Float

dotprod l s = sum [a * b | (a , b) <- zip l s]

--ex 2.9

divprop :: Integer -> [Integer]

divprop n = [x | x <- [1 .. n-1], rem n x == 0]

--ex 2.10

perfeitos :: Integer -> [Integer]

perfeitos n = [x | x<- [1 .. n], sum (divprop x) == x]

--ex 2.11
pitagoricos :: Integer -> [(Integer, Integer, Integer)]

pitagoricos n = [(x,y,z) | x<-[1..n] ,y<-[1..n], z<-[1..n], x^2 + y^2 == z^2]

--ex 2.12
primo :: Integer -> Bool

primo n = length (divprop n) == 1

--ex 2.13 
mersennes :: [Int]

mersennes = [2^x -1 | x<-[1 .. 30], primo (2^x -1)]

--ex 2.14

pascal :: Integer -> [[Integer]]

binom :: Integer -> Integer -> Integer
binom n k
    | k < n-k = div (product [n-k+1 .. n]) (product [1 .. k])
    | k >= n-k = div (product [k+1 .. n]) (product [1 .. n-k])

pascal n = [[binom x k | k<- [0 .. x]] | x<- [0 .. n]]

--ex 2.15

cifrar :: Int -> String -> String

letraInt :: Char -> Int
letraInt c = ord c - ord 'A'

intLetra :: Int -> Char
intLetra n = chr (n + ord 'A')

maiuscula :: Char -> Bool
maiuscula = isAsciiUpper

desloca :: Int -> Char -> Char
desloca k x
    | maiuscula x = intLetra (mod (letraInt x + k) 26)
    | otherwise = x

cifrar k xs = [desloca k x | x<-xs]

--ex 2.16
concat' :: [[a]] ->[a]

concat' l = [x | n<-l, x<-n]

replicate' :: Integral a => a -> b -> [b]

replicate' x k = [k | _<-[1..x]]

(!!!) :: Integral b => [a] -> b -> a

l !!! x = head [n | (n,i)<- zip l [0..], i == x]

--ex 2.17
forte :: String -> Bool

forte l = length l >= 8 && checkNumber l && checkUpperCase l && checkLowerCase l

checkNumber :: String -> Bool

checkNumber l = or [isNumber x | x<-l]

checkUpperCase :: String -> Bool
checkUpperCase l = or [isAsciiUpper x | x<-l]

checkLowerCase :: String -> Bool
checkLowerCase l = or [isAsciiLower x | x<-l]

--ex 2.18
--a) 
mindiv :: Int -> Int
mindiv x
    |null l = x
    | otherwise = head l
    where l = [n | n<-[2 .. (floor (sqrt (fromIntegral x)))], rem x n == 0]

--b)
prime :: Int -> Bool

prime n = n > 1 && mindiv n == n

--ex 2.19
nub :: Eq a => [a] -> [a]

nub [] = []
nub (x:xs) = x:(nub [n | n<-xs, n /= x])


--ex 2.20

transposta :: [[a]] -> [[a]]
transposta [] = []
transposta x = map (head) x:transposta [tail s | s<-x, length s > 1]

--ex 2.21
algarismos :: Int -> [Int]

algarismos n =  reverse (algarismosAux n)

algarismosAux 0 = []
algarismosAux n = (rem n 10):(algarismosAux (div n 10))

--ex 2.22
toBits :: Int -> [Int]

toBits 0 = [0]
toBits n =  reverse (toBitsAux n)

toBitsAux 0 = []
toBitsAux n = (rem n 2):(toBitsAux (div n 2))

--ex 2.23
fromBits :: [Int] -> Int

fromBits l = sum [n * 2^i  | (n,i) <- zip (reverse l) [0..]]

--ex 2.24
--a)
merge :: Ord a => [a] -> [a] -> [a]

merge [] l = l
merge l [] = l
merge (x:xs) (xa:xsa)
    | x < xa = x:(merge xs (xa:xsa))
    | otherwise = xa:(merge (x:xs) xsa)

--b)
msort :: Ord a => [a] -> [a]

msort [] = []
msort [x] = [x]
msort l = merge (msort a) (msort b)
    where (a,b) = metades l

metades :: [a] -> ([a], [a])
metades l = splitAt s l
    where s = div (length l) 2
