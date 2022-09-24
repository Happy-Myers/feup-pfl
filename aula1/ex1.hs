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
classificaimc :: Float -> Float -> String
classificaimc p a 
    | imc < 18.5 = "baixo peso" 
    | imc < 25 = "peso normal"
    | imc < 30 = "excesso de peso"
    | otherwise = "obesidade"
    where imc = p / a**2

--ex 1.11
--a)
max3, min3 :: Ord a => a -> a -> a -> a
max3 a b c 
    | a >= b = if a >= c then a else c
    | b >= a = if b >= c then b else c
    | c >= a = if c >= b then c else b

min3 a b c 
    | a <= b = if a <= c then a else c
    | b <= a = if b <= c then b else c
    | c <= a = if c <= b then c else b

--ex 1.12
xor :: Bool -> Bool -> Bool
xor True True = False
xor False False = False
xor _ _ = True

--ex 1.13
safetail, safetail', safetail'':: [a] -> [a]
safetail l = if length l > 0 then tail l else []

safetail' l 
    | length l > 0 = tail l
    | otherwise = []

safetail'' [] = [] 
safetail'' l = tail l

--ex 1.14
--a)
curta :: [a] -> Bool
curta l = length l <= 2

--b)
curta' :: [a] -> Bool
curta' [] = True
curta' [_] = True
curta' [_,_] = True
curta' _ = False

--ex 1.15
--a)
mediana :: Ord a => a -> a -> a -> a
mediana a b c 
    | (a >= b && b >= c) || (c >= b && b >= a) = b
    | (b >= a && a >= c) || (c >= a && a >= b) = a
    | (a <= c && c >= b) || (b >= c && c >= a) = c

--b)
mediana' :: (Ord a, Num a) => a -> a -> a -> a
mediana' a b c = a + b + c - d - e
    where { d = max3 a b c ; e = min3 a b c }

--ex 1.16
converte100 :: (Integral a) => a -> String
converte100 1 = "um"
converte100 2 = "dois"
converte100 3 = "tres"
converte100 4 = "quatro"
converte100 5 = "cinco"
converte100 6 = "seis"
converte100 7 = "sete"
converte100 8 = "oito"
converte100 9 = "nove"
converte100 10 = "dez"
converte100 11 = "onze"
converte100 12 = "doze"
converte100 13 = "treze"
converte100 14 = "catorze"
converte100 15 = "quinze"
converte100 16 = "dezasseis"
converte100 17 = "dezassete"
converte100 18 = "dezoito"
converte100 19 = "dezanove"
converte100 20 = "vinte"
converte100 30 = "trinta"
converte100 40 = "quarenta"
converte100 50 = "cinquenta"
converte100 60 = "sessenta"
converte100 70 = "setenta"
converte100 80 = "oitenta"
converte100 90 = "noventa"
converte100 n
    | n <= 0 = error "Numero negativo ou nulo"
    | n >= 100 = error "Numero maior ou igual a 100"
    | otherwise = (converte100 (n - (mod n 10))) ++ " e " ++ (converte100 (mod n 10))

converte1000 :: (Integral a) => a -> String
converte1000 100 = "cem"
converte1000 200 = "duzentos"
converte1000 300 = "tresentos"
converte1000 400 = "quatrocentos"
converte1000 500 = "quinhentos"
converte1000 600 = "seicentos"
converte1000 700 = "setecentos"
converte1000 800 = "oitocentos"
converte1000 900 = "novecentos"
converte1000 n
    | n <= 0 = error "Numero negativo ou nulo"
    | n >= 1000 = error "Numero maior ou igual a 1000"
    | n < 100 = converte100 n
    | n < 200 = "cento e " ++ (converte100 (mod n 100))
    | otherwise = (converte1000 (n - (mod n 100))) ++ " e " ++ (converte100 (mod n 100))

converte :: (Integral a) => a -> String
converte n
    | n <= 0 = error "Numero negativo ou nulo"
    | n >= 1000000 = error "Numero maior ou igual a 1000000"
    | n < 1000 = converte1000 n
    | n < 2000 = "mil" ++ converteAux n1000
    | otherwise = (converte1000 (div n 1000)) ++ " mil" ++ converteAux n1000
    where n1000 = mod n 1000
          converteAux n1000 = if n1000 == 0
                                then ""
                                else (if (n1000 <= 100 || mod n1000 100 == 0) then " e " else " ") ++ converte1000 n1000