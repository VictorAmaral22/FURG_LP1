package main

import "fmt"

func hailstone(n int) int {

	if n != 1 {
	
		if n % 2 == 0 {
		
			fmt.Println(n / 2)
		
			return hailstone(n / 2)
		
		} else {
		
			fmt.Println((n * 3) + 1)
		
			return hailstone((n * 3) + 1)
		
		}
	
	}
	
	return 1

}

func main() {

	hailstone(12)

}
