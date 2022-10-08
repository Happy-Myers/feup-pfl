--ex 3.1
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Eta reduce" #-}

mapFilter :: (a -> b) -> (a -> Bool) -> [a] -> [b]

mapFilter f p l = map f (filter p l)

mapFilter' :: (a -> b) -> (a -> Bool) -> [a] -> [b]

mapFilter' f p l = map f $ filter p l

mapFilter'' :: (a -> b) -> (a -> Bool) -> [a] -> [b]
mapFilter'' f p l = (map f . filter p) l

--ex 3.2

dec2int :: (Integral  a) => [a] -> a

dec2int l = foldl(\acc x -> acc* 10 + x) 0 l

dec2int'1 :: (Integral a) => [a] -> a
dec2int'1 = foldl(\acc x -> acc* 10 + x) 0

dec2int'2 :: (Integral a) => [a] -> a
dec2int'2 = foldl(\acc x -> (+) (acc*10) x) 0

dec2int'3 :: (Integral a) => [a] -> a
dec2int'3 = foldl(\acc -> (+) (acc*10)) 0

dec2int'4 :: (Integral a) => [a] -> a
dec2int'4 = foldl(\acc -> (+) ((*10) acc)) 0

dec2int'5 :: (Integral a) => [a] -> a
dec2int'5 = foldl((+) . (*10)) 0

--ex 3.3
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]

zipWith' f [] [] = []
zipWith' f [] ys = []
zipWith' f ys [] = []
zipWith' f (x:xs) (y:ys) =  f x y:zipWith' f xs ys

--ex 3.4
insert :: Ord a => a -> [a] -> [a]

insert a [] = [a]
insert a (x:xs)
    | x > a = a:x:xs
    |otherwise = x:insert a xs

isort :: Ord a => [a] -> [a]

isort l = foldr insert [] l

--ex 3.5

--a)
compMax :: Ord a => a -> a -> a
compMax x y
    | x > y = x
    | otherwise = y

compMin :: Ord a => a -> a -> a
compMin x y
    | x < y = x
    | otherwise = y

maximum' :: Ord a => [a] -> a

maximum' l = foldl1 compMax l

minimum' :: Ord a => [a] -> a

minimum' l = foldl1 compMin l


--b)

--foldl1' :: Foldable t => (a -> a -> a) -> t a -> a
--
--foldl1' f l = foldl f l


--TODO: perguntar sobre este ex ao stor

--ex 3.6

mdc :: (Integral a) => a -> a -> a

mdc a b = if b == 0 then a else mdc b (a `mod` b)

mdc' :: (Integral a) => a -> a -> a

mdc' a b = mdcAux (until (\(x,y) -> y == 0) (\(x, y) -> (y, x `mod` y)) (a, b))

mdcAux :: (Integral a) => (a, a) -> a

mdcAux (a, b) = a

--ex 3.7

--a 
(+++) :: [a] -> [a] -> [a]

(+++) l s = foldr (:) s l

--b
concatRight :: [[a]] -> [a]

concatRight l = foldr (++) [] l


--c
reverseRight :: [a] -> [a]

reverseRight l = foldr (\x acc -> (++) acc [x]) [] l

--d
reverseLeft :: [a] -> [a]

reverseLeft = foldl (\acc-> (:acc)) []

--e

elemAny :: Eq a => a -> [a] -> Bool

elemAny x l = any (== x) l

--ex 3.8

--a
palavras :: String -> [String]

palavras [] = []
palavras l = takeWhile (/= ' ') l:palavras (dropWhile (== ' ') (dropWhile (/= ' ') l))

--b 

despalavras :: [String] -> String

despalavras l = foldl (\x acc -> x ++ [' '] ++ acc) [] l

-- TODO : perguntar ao stor pq q o espaço aparecece no inicio

--ex 3.9
scanl' :: (b -> a -> b) -> b -> [a] -> [b]

scanl' f y [] = [y]

scanl' f y (x:xs) = y:scanl' f (f y x) xs