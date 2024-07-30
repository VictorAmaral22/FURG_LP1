package main

import "fmt"
// import "math"
import "bufio"
import "os"
import "strconv"

func main () {
	reader := bufio.NewReader(os.Stdin)
	fmt.Print("Informe um número: ")
	x, _ := reader.ReadString('\n')
	xInt, _ := strconv.Atoi(x[:len(x)-2])

	if xInt == 0 {
		fmt.Println("Não é primo!")
		return
	}

	divisors := 0

	for i := 1; i <= xInt; i++ {
		rest := xInt % i

		if rest == 0 {
			divisors += 1
		}
		if divisors > 2 {
			break
		}
	}

	if divisors > 2 {
		fmt.Println("Não é primo!")
	} else {
		fmt.Println("É primo!")
	}
	
	return
}