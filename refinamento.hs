separaLinhas :: String -> [String]
separaLinhas [] = []
separaLinhas s = takeWhile (/= '\n') s : separaLinhas(auxseparaLinhas s)


auxseparaLinhas :: String->String
auxseparaLinhas s =  dropWhile (== '\n') (dropWhile (/= '\n') s)


tamanhoMaiorLinha :: [String]-> Int
tamanhoMaiorLinha s = maximum( [length(x)|x <-s])

junta :: [String] -> String
junta [] = ""
junta ( a : x ) = a ++ junta x 

conta :: [[String]] -> [(String,Int)]
conta [] = []
conta (a:x) = ( tira a , length(tira a)) : (conta (x))

tira :: [String] -> String
tira [] = ""
tira (t:x) = t

--a partir daqui, nn tenho certeza de nada

justifica :: String -> String
justifica a = junta( criaEspaso ( conta( ( separalinhas a ) ) ) , tamanhoMaiorLinha a  )

-- criaespaso ta todo errado, pq eu ia comesar a fazer ele em listcompresion agr
criaEspaso :: [(String,Int)] -> Int -> [String]
criaEspaso [ ( ( a : z ) ,b ) x 
        | [a] == ""            let  ""
        | b == x               let  ""
        | x - b > 0 && a /= ' ' = [a] ++ criaEspaso (z,b+1) (x-1)
        | otherwise             = [a] ++ " " ++ criaEspaso (z,b+1) (x-1)
         --x - b > 0 && a == ' '