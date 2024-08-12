
power :: Float -> Float -> Float
power x n = x ** n   

prime :: Int -> Bool
prime n
  | n <= 1    = False
  | otherwise = not (hasDivisors n 2)

hasDivisors :: Int -> Int -> Bool
hasDivisors n c
  | c * c > n     = False
  | n `mod` c == 0 = True
  | otherwise      = hasDivisors n (c + 1)

natural :: Int -> Int -> [Int] -> [Int]
natural n c list
  | c > n = list
  | odd c  = natural n (c + 1) (list ++ [c])
  | otherwise = natural n (c + 1) list

convertFahrToCelsius :: Float -> Float
convertFahrToCelsius x = ((x-32) * 5) / 9
  
main :: IO ()
main = do
  -- 1. Dados um inteiro x e um inteiro não-negativo n, calcular 𝑥^𝑛.
  putStrLn "Potenciação"
  putStrLn "Informe o x: "
  inputX1 <- getLine
  let x1 = read inputX1 :: Float
  putStrLn "Informe o n: "
  inputN1 <- getLine
  let n1 = read inputN1 :: Float
  print(power x1 n1)

  -- 2. Dado um inteiro positivo n, verificar se n é primo
  putStrLn "Número primo"
  putStrLn "Informe o n: "
  inputN2 <- getLine
  let n2 = read inputN2 :: Int
  print $ prime n2
  

  -- 3. Dado um número inteiro positivo n, imprimir os n primeiros naturais ímpares
  putStrLn "Naturais ímpares"
  putStrLn "Informe o n: "
  inputN3 <- getLine
  let n3 = read inputN3 :: Int
  let list = []
  print(natural n3 0 list)

  -- 4. Escreva um programa que converta temperaturas de Fahrenheit para Celsius, seguindo a equação
  putStrLn "Fahrenheit para Celsius"
  putStrLn "Informe a temperatura em Fahrenheit: "
  inputN4 <- getLine
  let n4 = read inputN4 :: Float
  print(convertFahrToCelsius n4)