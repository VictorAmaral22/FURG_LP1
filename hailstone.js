function main(){

    function hailstone(n){
        if (n !== 1){
            if (n % 2 === 0) {
                console.log("\n", n/2)
                return hailstone(n/2)
            }
            else {
                console.log("\n", (n*3)+1)
                return hailstone((n*3)+1)
            }
        }
    }

    return hailstone(12)
}

main()