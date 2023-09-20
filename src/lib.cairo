// mod hello_world;


// mod _01_basics;
// mod _02_collections;


mod _03_array;
// use _03_array::{pop_front_example, array_access_example, array_access_example2, array_empty_example, array_size_example, enum_example1};
mod _04_dictionaries;
mod _05_ownership;
use _04_dictionaries::{user_db_example};
use _05_ownership::{snapshot_example, desnap_example};

fn main() {
    // pop_front_example();
    // array_access_example();
    // array_access_example2(1);
    // array_size_example();
    // array_empty_example();


    // enum_example1();
    // dict_nullable_example();
    // user_db_example();


    snapshot_example();
    desnap_example();
}