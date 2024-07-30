package main

import "fmt"
import "bufio"
import "os"
import "strconv"

func main () {
	reader := bufio.NewReader(os.Stdin)
	fmt.Print("Informe um número: ")
	x, _ := reader.ReadString('\n')
	xInt, _ := strconv.Atoi(x[:len(x)-2])

	for i := 1; i <= xInt; i++ {
		rest := i % 2

		if rest != 0 {
			fmt.Println(i)
		}
	}	
}