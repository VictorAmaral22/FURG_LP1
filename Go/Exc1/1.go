package main

import "fmt"
import "math"
import "bufio"
import "os"
import "strconv"

func main () {
	reader := bufio.NewReader(os.Stdin)
	fmt.Print("Informe o valor de x: ")
	x, _ := reader.ReadString('\n')

	fmt.Print("Informe o valor de n: ")
	n, _ := reader.ReadString('\n')

	xInt, _ := strconv.ParseFloat(x[:len(x)-2], 64)
	nInt, _ := strconv.ParseFloat(n[:len(n)-2], 64)

	result := math.Pow(xInt, nInt)

	fmt.Println("result = ",result)
}