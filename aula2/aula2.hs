--ex 2.1
--a)

{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
import Distribution.SPDX (LicenseId(RPL_1_5))
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use foldl" #-}

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
interperse _ (x:[]) = [x]
interperse a (x:xs) = x:a:(interperse a xs)

--ex 2.6

squaresum :: Integral a => a -> a

squaresum n = sum [x^2 | x <- [1 .. n]]