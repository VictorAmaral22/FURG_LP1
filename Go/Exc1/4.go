package main

import "fmt"
import "bufio"
import "os"
import "strconv"

func main () {
	reader := bufio.NewReader(os.Stdin)
	fmt.Print("Informe um número: ")
	farh, _ := reader.ReadString('\n')
	farhInt, _ := strconv.Atoi(farh[:len(farh)-2])

	celscius := ((farhInt - 32) * 5)/9

	fmt.Println("Celscius ",celscius, "°")
}