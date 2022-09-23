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
binom' n k 
    | k < n-k = div (product [n-k+1 .. n]) (product [1 .. k])
    | k >= n-k = div (product [k+1 .. n]) (product [1 .. n-k])

--ex 1.6
raizes :: Float -> Float -> Float -> (Float, Float)
raizes a b c = ((-b + sqrt d)/(2 * a), (-b - sqrt d)/(2 * a))
    where d = b**2 - 4 * a * c

--ex 1.8

--a)
segundo xs = head(tail xs)

--b) 
trocar (x, y) = (y,x)

--c)
par x y = (x,y)

--d)
dobro x = 2 * x

--e)
metade x = x/2

--f)
minuscula x = x >= 'a' && x <= 'z'

--g)
intervalo x a b = x >= a && x <= b

--h)
palindromo xs = reverse xs == xs

--i)
twice f x = f (f x)

--ex 1.9
classifica :: Int -> String 
classifica x = if x <= 9 then "reprovado" else (if x <= 12 then "suficiente" else (if x <= 15 then "bom" else (if x <= 18 then "muito bom" else "muito bom com distincao")))

classifica' :: Int -> String
classifica' x 
    | x <= 9 = "reprovado" 
    | x <= 12 = "suficiente"
    | x <= 15 = "bom"
    | x <= 18 = "muito bom"
    | x <= 20 = "muito bom com distincao"
    | otherwise = "valor invalido"

--ex 1.10
classificaIMC :: Float -> Float -> String
classificaIMC p a 
    | IMC < 18.5 = "baixo peso" 
    | IMC < 25 = "peso normal"
    | IMC < 30 = "excesso de peso"
    | otherwise = "obesidade"
    where IMC = p / a**2