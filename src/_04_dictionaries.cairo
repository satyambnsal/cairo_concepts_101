use dict::Felt252DictTrait;
use nullable::{nullable_from_box, match_nullable, FromNullableResult};

use debug::PrintTrait;

// fn dict_nullable_example() {
//     let mut d: Felt252Dict<Nullable<Span<felt252>>> = Default::default();
//     // 'Dict Nullable'.print();

//     let mut a = ArrayTrait::new();
//     a.append('Satyam');
//     a.append('Shivam');
//     a.append('Raja');

//     d.insert(0, nullable_from_box(BoxTrait::new(a.span())));

//     let val = d.get(0);

//     let span = match match_nullable(val) {
//         FromNullableResult::Null(()) => panic_with_felt252('No Value Found'),
//         FromNullableResult::NotNull(val) => val.unbox()
//     };

//     let first_el = *span.at(0);
//     // first_el.print();

//     assert(*span.at(0) == 'Satyam', 'Expecting Satyam');
//     assert(*span.at(1) == 'Shivam', 'Expecting Shivam');
//     assert(*span.at(2) == 'Raja', 'Expecting Raja');

// }

struct UserDatabase<T> {
    users_amount: u64,
    balances: Felt252Dict<T>
}

trait UserDatabaseTrait<T> {
    fn new() -> UserDatabase<T>;
    fn add_user<impl TDrop: Drop<T>>(ref self: UserDatabase<T>, name: felt252, balance: T);
    fn get_user<impl TCopy: Copy<T>>(ref self: UserDatabase<T>, name: felt252) -> T;
}

impl UserDatabaseImpl<T, impl TDefault: Felt252DictValue<T>> of UserDatabaseTrait<T> {

    fn new() -> UserDatabase<T> {
        UserDatabase {
            users_amount: 0,
            balances: Default::default()
        }
    }

    fn get_user<impl TCopy: Copy<T>>(ref self: UserDatabase<T>, name: felt252) -> T {
        self.balances.get(name)
    }

    fn add_user<impl TDrop: Drop<T>>(ref self: UserDatabase<T>, name: felt252, balance: T) {
        self.balances.insert(name, balance);
        self.users_amount += 1;
    }
}


impl UserDatabaseDestruct<
T, impl TDrop: Drop<T>, impl TDefault: Felt252DictValue<T>> of Destruct<UserDatabase<T>> {
    fn destruct(self: UserDatabase<T>) nopanic {
        self.balances.squash();
    }
}

fn user_db_example() {
    let mut db = UserDatabaseTrait::<usize>::new();
    db.add_user('Satyam', 100);
    db.add_user('Shivam', 50);

    let satyam_balance = db.get_user('Satyam');
    let shivam_balance = db.get_user('Shivam');

    assert(satyam_balance == 100, 'Expected 100');
    assert(shivam_balance == 50, 'Expected 50');
}