--ex 1.1
testaTriangulo :: Float ->Float ->Float -> Bool
testaTriangulo a b c = x && y && z
    where x = a + b > c
          y = a + c > b
          z = b + c > a
                    

--ex 1.2
areaTriangulo :: Float ->Float ->Float ->Float 
areaTriangulo a b c = sqrt (s * (s - a) * (s - b) * (s - c))
    where s = (a + b + c)/2
                
--ex 1.3
metades :: [a] -> ([a], [a])
metades l = (take s l , drop s l)
    where s = div (length l) 2           

--ex 1.4
--a) "last" function
last' :: [a] -> a
last' l = head (reverse l)

--OR
last'' :: [a] -> a
last'' l = head (drop (length l - 1) l)

--b) "init" function
init' :: [a] -> [a]
init' l = reverse (tail (reverse l))

--OR 
init'' :: [a] -> [a]
init'' l = take (length l - 1) l

--OR 
init''' :: [a] -> [a]
init''' l = reverse (drop 1 (reverse l))

--ex 1.5
--a)
binom :: Integer -> Integer -> Integer
binom n k = div (product [1 .. n]) (product [1 .. k] * product [1 .. n-k])

--b)
binom' :: Integer -> Integer -> Integer
binom n k 
| k < n-k = div (product [n-k+1 .. n]) (product [1 .. k])
| k >= n-k = div (product [k+1 .. n]) (product [1 .. n-k])
--error here fix later