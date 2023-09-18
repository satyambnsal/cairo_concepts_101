use debug::PrintTrait;
use dict::Felt252DictTrait;
use dict::Felt252DictEntryTrait;
use clone::Clone;
use array::ArrayTCloneImpl;


// You can create and use array methods by importing the `array:ArrayTrait` trait



fn custom_get<T, impl TDefault: Felt252DictValue<T>, impl TDrop: Drop<T>, impl TCopy: Copy<T>>(
    ref dict: Felt252Dict<T>, key: felt252
) -> T {
    let (entry, prev_value) = dict.entry(key);
    let return_value = prev_value;

    dict = entry.finalize(prev_value);
    return_value
}


fn custom_insert<T, impl TDefault: Felt252DictValue<T>, impl TDestruct: Destruct<T>, impl TPrint: PrintTrait<T>, impl TDrop: Drop<T>>(
    ref dict: Felt252Dict<T>, key: felt252, value: T
) {
    let (entry, _prev_value) = dict.entry(key);
    dict = entry.finalize(value)
}

fn main(){
    let mut arr = ArrayTrait::<u128>::new();
    arr.append(100);
    arr.append(144);

    let index_to_access = 1;

    let val = match arr.get(index_to_access) {
        Option::Some(x) => {
            *x.unbox()
        },
        Option::None(_) => {
            let mut data = ArrayTrait::new();
            data.append('out of bounds');
            panic(data)
        }
    };

    val.print();


// Dictionaries

let mut balances: Felt252Dict<u64> = Default::default();

balances.insert('Satyam', 100);
balances.insert('Shivam', 200);

let satyam_balance = balances.get('Satyam');

assert(satyam_balance == 100, 'Balance is not 100');

balances.insert('Satyam', 123);

let satyam_balance_2 = balances.get('Satyam');

assert(satyam_balance_2 == 123, 'Balance is not 123');

let shivam_balance = balances.get('Shivam');

assert(shivam_balance == 200, 'Balance is not 200');


'-Custom Method-'.print();

let mut dict: Felt252Dict<u64> = Default::default();

custom_insert(ref dict, '0', 100);

let val = custom_get(ref dict, '0');

val.print();


'- Array Clone -'.print();

let mut arr1 = ArrayTrait::<u128>::new();
arr1.append(1);
arr1.append(2);

let arr2 = arr1.clone();

assert(arr1 == arr2, 'Arr1 is not similar to arr2');



}