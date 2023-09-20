use debug::PrintTrait;

fn snapshot_example() {
let mut arr1 = ArrayTrait::<usize>::new();
let first_shapshot = @arr1;
arr1.append(1);

let first_length = calculate_length(first_shapshot);
'First Length:'.print();
first_length.print();

let second_length = calculate_length(@arr1);

'Second Length'.print();
second_length.print();
}


#[derive(Copy, Drop)]
struct Rectangle {
    height: usize,
    width: usize
}

fn desnap_example() {
    let rec = Rectangle {height: 3, width: 30};
    let area = calculate_area(@rec);

    'Rectangle Area'.print();
    area.print();
}
fn calculate_area(rec: @Rectangle) -> usize {
    *rec.height * *rec.width
}

fn calculate_length(arr: @Array<usize>) -> usize {
    arr.len()
} 

