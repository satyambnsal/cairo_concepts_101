use debug::PrintTrait;

#[derive(Drop)]
enum Direction {
    North,
    East,
    West,
    South
}

#[derive(Drop)]
enum Message {
    Quit,
    Echo: felt252,
    Move: (usize, usize)
}

trait Processing {
    fn process(self: Message);
}

impl ProcessingImpl of Processing {
    fn process(self: Message) {
        match self {
            Message::Quit => {
                'quitting'.print();
            },
            Message::Echo(value) => {
                value.print();
            },
            Message::Move((x,y)) => {
                'moving'.print();
                x.print();
                y.print();
            }
        }
    }
}

fn message_example() {
    let msg = Message::Move((10,20));
    msg.process();
}

fn find_value_recursive(arr: @Array<felt252>, value: felt252, index: usize) -> Option<usize> {
    if index >= arr.len() {
        return Option::None;
    }
    if *arr.at(index) == value {
        return Option::Some(index);
    }
    find_value_recursive(arr, value, index +1)
}


fn find_value_recursive_example() {
    let mut arr = ArrayTrait::new();
    arr.append(1);
    arr.append(3);
    arr.append(5);
    arr.append(11);
    arr.append(33);
    arr.append(57);

    let value_to_find = 330;
    let result = find_value_recursive(@arr, value_to_find, 0);

    match result {
        Option::Some(index) => {
            if index == 4 {
                'it worked'.print();
            }
        },
        Option::None => {
            'Not found'.print();
        }
    }
}