//
// Created by Vishal Paudel on 14/03/22.
//

#include <cstdio>
#include <cstring>

int main() {

    char ch[30];
    scanf("30s", ch);

    for (int i=0; ch[i]!=NULL; i++) {

        printf("%i %i\n", i, (unsigned char) ch[i]);

    }

    printf("\n %s", ch);
    printf("\n विशाल \n");

    int len = strlen("विशाल");

    printf("%d \n", len);

}
