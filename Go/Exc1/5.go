package main

import "fmt"
import "bufio"
import "os"
import "strings"

func main () {
	reader := bufio.NewReader(os.Stdin)
	
	fmt.Print("Informe a frase: ")
	frase, _ := reader.ReadString('\n')
	frase = strings.TrimSpace(frase)

	fmt.Print("Informe a palavra: ")
	palavra, _ := reader.ReadString('\n')
	palavra = strings.TrimSpace(palavra)
	
	ocorrencias := strings.Count(frase, palavra)
	
	fmt.Printf("A palavra '%s' ocorre %d vezes na frase.\n", palavra, ocorrencias)
}
