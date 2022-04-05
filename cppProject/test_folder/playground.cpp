#include <iostream>
#include <string>

class ChainNode {
    friend class Chain;

public :
    explicit ChainNode( int element = 0, ChainNode *next = nullptr )
    {    data = element; link = next;    }

private:
    int data;
    ChainNode *link;
};

class Chain {

private:
        ChainNode *first;
public:
    Chain() {   first = nullptr;    }

    void insert_begin(int);
    void insert_end(int);

    static void print_chain(Chain chain_to_print) {
        ChainNode *tmp = chain_to_print.first;

        while (tmp) {
            std::cout << (*tmp).data << std::endl;
            tmp = tmp->link;
        }
    }
};


void Chain::insert_end(int int_add_end) {
    ChainNode *tmp = this->first;

    if (first)
    {
        // Traversing to the end node

        while (     (*tmp).link != nullptr     )
        {
            tmp = tmp->link;
        }

        tmp->link = new ChainNode(int_add_end, nullptr);

        std::cout << "ADDED : the node was added at the very end of chain" << std::endl;
    }

    else
    {
        // Creating the new chain
        this->first = new ChainNode(int_add_end, nullptr);

        std::cout << "CREATED : new chain was created" << std::endl;
    }

};


void Chain::insert_begin(int int_add_begin) {
    ChainNode* tmp = new ChainNode(int_add_begin, this->first);

    this->first = tmp;
}


int main() {

    Chain my_first_chain;

    my_first_chain.insert_begin(16);
    my_first_chain.insert_end(-100);

    Chain::print_chain(my_first_chain);

    return 0;

}
