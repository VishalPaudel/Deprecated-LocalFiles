//
// Created by Vishal Paudel on 16/04/22.
//

#include <iostream>
#include "linked_lists.h"

int main() {
    std::cout << "Running Main" << std::endl;

    Chain my_first_chain;

    Chain::change_name(my_first_chain, "My First Chain");

    my_first_chain.insert_begin(16);
    my_first_chain.insert_begin(116);
    my_first_chain.insert_end(-100);
    my_first_chain.insert_begin(6);
    my_first_chain.insert_end(-10);

    Chain::print_chain(my_first_chain);

    return 0;
}
