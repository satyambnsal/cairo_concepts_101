use debug::PrintTrait;


#[derive(Drop)]
struct User {
    active: bool,
    username: felt252,
    email: felt252,
    sign_in_count: u64
}

#[derive(Drop, Copy)]
struct Rectangle {
    width: u64,
    height: u64
}

fn area(rect: @Rectangle) -> u64 {
    *rect.width * *rect.height
}

impl RectanglePrintImpl of PrintTrait<Rectangle> {
    fn print(self: Rectangle) {
        'Rectangle Width And Height'.print();
        (self.width).print();
        (self.height).print();
    }
}


trait RectangleTrait {
    fn area(self: @Rectangle) -> u64;
    fn can_hold(self: @Rectangle, second_rect: @Rectangle) -> bool;
    fn square(side: u64) -> Rectangle;
}

impl RectangleImpl of RectangleTrait {
    fn area(self: @Rectangle) -> u64 {
        (*self.width) * (*self.height)
    }

    fn can_hold(self: @Rectangle, second_rect: @Rectangle) -> bool {
        (*self.width) > (*second_rect.width) && (*self.height) > (*second_rect.height)
    }

    fn square(side: u64) -> Rectangle {
        Rectangle {width: side, height: side}
    }
}

fn area_example() {
    let rect1 = Rectangle {width: 10, height: 25};
    rect1.print();
    'Rect1 area:'.print();
    let area = rect1.area();
    area.print();

    let rect2 = Rectangle {width: 9, height: 30};
    let rect3 = Rectangle {width: 12, height: 20};
    let rect4 = Rectangle {width: 9, height: 24};
    
    rect1.can_hold(@rect2).print();
    rect1.can_hold(@rect3).print();
    rect1.can_hold(@rect4).print();

    let sq1 = RectangleTrait::square(10);
    sq1.width.print();
    sq1.height.print();
    sq1.area().print();
}


#[cfg(test)]
mod test {

    use super::{Rectangle, RectangleTrait};

    #[test]
    fn can_hold_smaller() {
        let rect1 = Rectangle {width: 10, height: 25};
        let rect4 = Rectangle {width: 9, height: 24};
        let result = rect1.can_hold(@rect4);
        assert(result, 'Failed to hold smaller rectagle');

    }
}