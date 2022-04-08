//
// Created by Vishal Paudel on 08/04/22.
//

#include <iostream>
#include <string>


class ChainNode {
    friend class Chain;

public :
    explicit ChainNode(int element = 0, ChainNode *next = nullptr) {
        data = element;
        link = next;
    }

private:
    int data;
    ChainNode *link;
};

class Chain {

private:
    ChainNode *first;
    std::string name_of_chain;

public:

    Chain() {
        first = nullptr;
        name_of_chain = "NO NAME";
    }

    void insert_begin(int);

    void insert_end(int);

    static void print_chain(const Chain &chain_to_print) {
        std::cout << "Starting to print the chain " << chain_to_print.name_of_chain << ":" << std::endl;

        ChainNode *tmp = chain_to_print.first;

        while (tmp) {
            std::cout << "-*-  " << (*tmp).data << "  -*-";
            tmp = tmp->link;
        }
    }

    static void change_name(Chain &chain_to_change, const std::string &str_new_name) {
        chain_to_change.name_of_chain;

        if (chain_to_change.name_of_chain != str_new_name) {
            chain_to_change.name_of_chain = str_new_name;
        } else {
            std::cout << "It already has this name" << std::endl;
        }
    }

};


void Chain::insert_end(int int_add_end) {
    ChainNode *tmp = this->first;

    if (this->first) {
        // Traversing to the end node

        while ((*tmp).link != nullptr) {
            tmp = tmp->link;
        }

        tmp->link = new ChainNode(int_add_end, nullptr);

        std::cout << "ADDED : new node was added at the very end of chain" << std::endl;
    } else {
        // Creating the new chain
        this->first = new ChainNode(int_add_end, nullptr);

        std::cout << "CRTED : new chain was created" << std::endl;
    }

}


void Chain::insert_begin(int int_add_begin) {
    if (this->first) {

        std::cout << "ADDED : new node was added in the very bgn of chain" << std::endl;
    } else {

        std::cout << "CRTED : new chain was created" << std::endl;
    }

    auto tmp = new ChainNode(int_add_begin, this->first);

    this->first = tmp;

}


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
