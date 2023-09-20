use debug::PrintTrait;
// mod hello_world;
// mod _01_basics;
// mod _02_collections;
mod _03_array;

mod _04_dictionaries;
mod _05_ownership;
mod _06_structs;
mod _07_enums;

//use _03_array::{pop_front_example, array_access_example, array_access_example2, array_empty_example, array_size_example, enum_example1};
use _04_dictionaries::{user_db_example};
use _05_ownership::{snapshot_example, desnap_example};
use _06_structs::{User, area_example};
use _07_enums::{message_example, find_value_recursive_example};

fn main() {
    // pop_front_example();
    // array_access_example();
    // array_access_example2(1);
    // array_size_example();
    // array_empty_example();


    // enum_example1();
    // dict_nullable_example();
    // user_db_example();


    // snapshot_example();
    // desnap_example();

    // let mut user1 = User {
    //     active: true,
    //     username: 'satyam',
    //     email: 'satyam@gmail.com',
    //     sign_in_count: 0
    // };

    // user1.email = 'sat@gmail.com';

    // let user_email = user1.email;
    // 'User Email'.print();
    // user1.email.print();
    // // user1.print();

    // area_example();
    // message_example();

    find_value_recursive_example();
    


}