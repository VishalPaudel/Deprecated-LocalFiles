//
// Created by Vishal Paudel on 08/04/22.
// Is not properly designed
// Need to create a traverse function, that gives a node equivalent to a node
//

#include <iostream>
#include <string>

// Defining the dynamic class type: ChainNode, representing the nodes
class ChainNode {
    friend class Chain;

public :
    explicit ChainNode(int element = 0, ChainNode *next = nullptr) {
        // I don't know why I am using the explicit keyword,
        // it was suggested by the IDE for single element declarations
        data = element;
        link = next;
    }

private:
    // The data in the nodes and the pointer to the next node needs to stay non-accessible publicly
    int data;
    ChainNode *link;
};

// Defining the dynamic class type Chain, representing the binding of the ChainNodes
class Chain {

private:
    // Things that need to stay hidden from the client code
    ChainNode *first;
    std::string name_of_chain;

public:

    Chain() {
        first = nullptr;
        name_of_chain = "N/A : No Name Provided while execution";  // The code doesn't run if I set it equal to nullptr
    }

    void insert_begin(int);

    void insert_end(int);

    // void insert_next_to(ChainNode &, int &);  // Need to finish this code

    static void print_chain(const Chain &chain_to_print) {
        std::cout << "Starting to print the chain " << chain_to_print.name_of_chain << ":" << std::endl;

        ChainNode *tmp = chain_to_print.first;

        // The following traversal has been repeated many times in the code, need to make a new Method Attribute
        while (tmp) {
            std::cout << "-*-  " << (*tmp).data << "  -*-";
            tmp = tmp->link;
        }
    }

    static void change_name(Chain &chain_to_change, const std::string &str_new_name) {

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

        // Traversal repeated, traversal to the end of the chain
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
