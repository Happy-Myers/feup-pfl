{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
data Arv a = Vazia | No a (Arv a) (Arv a) deriving Show

myArv :: Arv Int
myArv = No 3 (No 2 (No 1 Vazia Vazia) Vazia) (No 4 Vazia Vazia)

--ex 4.1
sumArv :: Num a => Arv a -> a
sumArv Vazia = 0
sumArv (No x l r) = x + sumArv l + sumArv r

-- ex 4.2

listar :: Arv a -> [a]
listar Vazia = []
listar (No x l r) = listar r ++ [x] ++ listar l

-- ex 4.3

nivel ::Int -> Arv a -> [a]
nivelAux :: Int -> Int -> Arv a -> [a]

nivel = nivelAux 0
nivelAux _ _ Vazia = []
nivelAux lvlaux lvl (No x l r)
    | lvlaux == lvl = [x]
    | otherwise = nivelAux (lvlaux+1) lvl l ++ nivelAux (lvlaux+1) lvl r

--ex 4.5

mapArv :: (a->b) -> Arv a -> Arv b 
mapArv _ Vazia = Vazia
mapArv f (No x l r) = No (f x) (mapArv f l) (mapArv f r) 

-- ex 4.6
-- a)

maisDir :: Arv a -> a
maisDir (No x _ Vazia) = x
maisDir (No _ _ dir) = maisDir dir

-- b)

remover :: Ord a => a -> Arv a -> Arv a
remover x Vazia = Vazia -- não ocorre
remover x (No y Vazia dir) -- um descendente
    | x==y = dir
remover x (No y esq Vazia) -- um descendente
    | x==y = esq
remover x (No y esq dir) -- dois descendentes
    | x<y = No y (remover x esq) dir
    | x>y = No y esq (remover x dir)
    | x==y = let z = maisDir esq
        in No z (remover z esq) dir