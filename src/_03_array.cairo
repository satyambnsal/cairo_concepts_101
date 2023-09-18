use debug::PrintTrait;
use array::ArrayTrait;

fn pop_front_example() {
    let mut a = ArrayTrait::new();
    a.append('Satyam');
    a.append('Shivam');
    a.append('Rahul');
    let first_value = a.pop_front().unwrap();
    'First Value:'.print();
    first_value.print();
}

fn array_access_example() {
    let mut a = ArrayTrait::new();
    a.append(100);
    a.append(39);
    a.append(56);

    let first_value = *a.at(0);
    let second_value = *a.at(1);

    first_value.print();
    second_value.print();
}

fn array_access_example2(index_to_access: usize) {
    let mut a = ArrayTrait::new();
    a.append(100);
    a.append(39);
    a.append(56);

    let val = match a.get(index_to_access) {
        Option::Some(x) => {
            *x.unbox()
        },
        Option::None => {
            let mut data = ArrayTrait::new();
            data.append('array index out of');
            data.append('bounds');
            panic(data)
        }
    };

    val.print();

}

fn array_size_example() {
    let mut a = ArrayTrait::new();
    a.append('Satyam');
    let size = a.len();
    'Array size'.print();
    size.print();
}

fn array_empty_example() {
    let mut a = ArrayTrait::<usize>::new();
    let is_empty = a.is_empty();
    'Is Array Empty: '.print();
    is_empty.print();
}


#[derive(Copy, Drop, Debug, PrintTrait)]
enum Data {
    Integer: u128,
    Felt: felt252,
    Tuple: (u32, u32)
}

fn enum_example1() {
    let mut messages: Array<Data> = ArrayTrait::new();
    messages.append(Data::Integer(7));
    messages.append(Data::Felt('hello world'));
    messages.append(Data::Tuple((10,30)));

    let second_val = *messages.at(1);
}