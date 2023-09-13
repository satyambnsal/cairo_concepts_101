use debug::PrintTrait;


fn main() {

    // 1. variable mutation
    // let mut x = 5;
    // x.print();
    // x = 6;
    // x.print();

    //2. loops 

    let mut counter = 0;

    let result = loop {
        if counter == 10 {
            break counter * 2;
        }
        counter += 1;
    };
    'The result is '.print();
    result.print();

    let fact_5 = factorial(5);
    'Factorial 5 '.print();
    fact_5.print();
}


fn fibonacci_no(n: usize) -> usize {
    if(n <= 1) {
        return n;
    }
    fibonacci_no(n-1) + fibonacci_no(n-2)
}

fn factorial(n: usize) -> usize{
    if (n <= 1) {
        return 1;
    }

    n*factorial(n-1)
}