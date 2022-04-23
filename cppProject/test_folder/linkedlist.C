//
//  Future: (important) . (urgent) .
//
//  Modifier: Vishal Paudel (2003)
//  Motivation: Assignment 2 :: Linked Lists
//  Scope:
//
//  Last Edit:
//
//  Note:
//

#include <iostream>  // exporting and importing data, in this program

using namespace std;  // namespace directive, for new ANSI C++ standards


// Defining the dynamic class type: ChainNode, representing the nodes
class ChainNode {

    friend class Chain; // we want the class Chain to be able to access all members of class Chain

private:

    int data;  // the integer object associated at each node
    ChainNode *link;  // the pointer to the next ChainNode object

public:

    ChainNode(int element = 0, ChainNode *next = nullptr)  // constructor for a ChainNode object
    {
        data = element;
        link = next;
    }
};


// Defining the dynamic class type Chain, representing the binding of the ChainNodes
class Chain {

// Things that need to stay hidden from the client code
private:

    ChainNode *first;  // the first element of the chain, a ChainNode object
    std::string name_of_chain;  // additionally defining a curious parameter

public:

    Chain() {
        first = NULL;
        name_of_chain = "NO-NAME";
    } // constructor for a Chain object

    void insert_begin(int);

    void insert_end(int);

    // void insert_next_to(ChainNode &, int &);  // Need to finish this code

    void remove(int);

    static void print_chain(const Chain &chain_to_print) {
        std::cout << "Starting to print the chain " << chain_to_print.name_of_chain << ":" << std::endl;

        ChainNode *tmp = chain_to_print.first;

        // The following traversal has been repeated many times in the code, need to make a new Method Attribute
        while (tmp != nullptr) {
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

    ~Chain() {      // destructor
        // front to back destruction of a Chain object
        ChainNode *tmp;
        while (this->first != nullptr) {
            tmp = first->link;
            delete first;
            first = tmp;
        }
    }

};


void Chain::insert_begin(int int_add_begin) {
    if (this->first) {

        std::cout << "ADDED : new node was added in the very bgn of chain" << std::endl;
    } else {

        std::cout << "CRTED : new chain was created" << std::endl;
    }

    ChainNode *tmp = new ChainNode(int_add_begin, this->first);

    this->first = tmp;

}


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


void Chain::remove(int x) {

    ChainNode *tmp = this->first;  // pointer to the first node of the Chain object

    // Loop removes a beginning strip of x's from the Chain 'this'
    while (this->first != nullptr && (this->first)->data == x) {

        // loop runs till either the first of the chain does not have x as data
        // or the chain totally is erased, (this->first == nullptr)

        this->first = (this->first)->link;  // changing where the head points to
        delete tmp;  // deleting the earlier first, which had a value of x stored
        tmp = this->first;  // resetting the tmp pointer to the new chain first
    }

    // If the chain was initially a chain of x's
    if (this->first == nullptr) { return; }

    ChainNode *prev = this->first;  // a new intermediate node, a temporary swapper

    // Loop runs to remove all x's that come somewhere inside the stripped chain
    while (tmp != nullptr) {
        if (tmp->data == x) {
            prev->link = tmp->link;
            delete tmp;
            tmp = prev->link;
            continue;
        }
        prev = tmp;
        tmp = tmp->link;
    }
}


int main() {
    Chain c;
    short int choice;
    int data;
    do {
        cout << endl << "	Insert at: 1. Beginning 2. End 3. Stop " << endl;
        cout << "	Enter your choice (1/2/3): ";
        cin >> choice;
        switch (choice) {
            case 1:
                cout << "Data to be inserted at beginning: ";
                cin >> data;
                c.insert_begin(data);
                break;
            case 2:
                cout << "Data to be inserted at end: ";
                cin >> data;
                c.insert_end(data);
                break;
        }
    } while (choice != 3);
    Chain::print_chain(c);
    cout << "Enter node to be removed : ";
    cin >> data;
    c.remove(data);
    Chain::print_chain(c);
    return 0;
}
