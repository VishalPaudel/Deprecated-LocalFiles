
#include <iostream>

#include <string>
#include <utility>

class Man {
    friend class Woman;
private:
    std::string name_man;
public:
    void print_woman(class Woman input) {
        std::cout << input.name_woman;
    }
};

class Woman {
private:
    std::string name_woman = NUL;
    int age = 0;

public:
    Woman(std::string name_entered, int age_entered){
        this->name_woman = std::move(name_entered);
        this->age = age_entered;
    }

    void print_woman(class Man input) {
        std::cout << input.name_man;
    }
};

int main() {
    Woman woman_1("hannah", 8);

}