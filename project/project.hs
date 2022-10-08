import Data.Map (Map)

type Term = (Int, String)
type Polynomial = [Term]

normalizeTerm :: Polynomial -> Polynomial
normalizeTerm (x:xs) = 

normalize :: Polynomial -> Polynomial
normalize [] = []
normalize = foldr normalizeTerm []