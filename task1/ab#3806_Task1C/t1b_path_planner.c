
/*
* AstroTinker Bot (AB): Task 1B Path Planner
*
* This program computes the valid path from the start point to the end point.
* Make sure you don't change anything outside the "Add your code here" section.
*/

#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>

#ifdef __linux__ // for host pc

    #include <stdio.h>

    void _put_byte(char c) { putchar(c); }

    void _put_str(char *str) {
        while (*str) {
            _put_byte(*str++);
        }
    }

    void print_output(uint8_t num) {
        if (num == 0) {
            putchar('0'); // if the number is 0, directly print '0'
            _put_byte('\n');
            return;
        }

        if (num < 0) {
            putchar('-'); // print the negative sign for negative numbers
            num = -num;   // make the number positive for easier processing
        }

        // convert the integer to a string
        char buffer[20]; // assuming a 32-bit integer, the maximum number of digits is 10 (plus sign and null terminator)
        uint8_t index = 0;

        while (num > 0) {
            buffer[index++] = '0' + num % 10; // convert the last digit to its character representation
            num /= 10;                        // move to the next digit
        }

        // print the characters in reverse order (from right to left)
        while (index > 0) { putchar(buffer[--index]); }
        _put_byte('\n');
    }

    void _put_value(uint8_t val) { print_output(val); }

#else  // for the test device

    void _put_value(uint8_t val) { }
    void _put_str(char *str) { }

#endif


// main function
int main(int argc, char const *argv[]) {

    #ifdef __linux__

        const uint8_t START_POINT   = atoi(argv[1]);
        const uint8_t END_POINT     = atoi(argv[2]);
        uint8_t CPU_DONE            = 0;

    #else

        #define START_POINT         (* (volatile uint8_t * ) 0x20000000)
        #define END_POINT           (* (volatile uint8_t * ) 0x20000001)
        #define CPU_DONE            (* (volatile uint8_t * ) 0x20000003)

    #endif

    // array to store the planned path
    uint8_t path_planned[32];

    // index to keep track of the path_planned array
    uint8_t idx = 0;

    // instead of using printf() function for debugging,
    // use the below function calls to print a number, string or a newline

    // for newline: _put_byte('\n');
    // for string:  _put_str("your string here");
    // for number:  _put_value(your_number_here);

    // Examples:
    // _put_value(START_POINT);
    // _put_value(END_POINT);
    // _put_str("Hello World!");
    // _put_byte('\n');

    // ############# Add your code here #############
int sV,a;
    //int path_planned[32];
    int cnt=0;
    int k;
	int A[30][30]={0};
    A[0][1]=1;A[1][0]=1;
    A[1][2]=1;A[2][1]=1;
    A[2][3]=1;A[3][2]=1;
    A[3][4]=2;A[4][3]=2;
    A[3][28]=3;A[28][3]=3;
    A[4][5]=1;A[5][4]=1;
    A[4][6]=3;A[6][4]=3;
    A[6][7]=2;A[7][6]=2;
    A[7][8]=1;A[8][7]=1;
    A[8][2]=1;A[2][8]=1;
    A[8][9]=1;A[9][8]=1;
    A[9][10]=1;A[10][9]=1;
    A[9][11]=1;A[11][9]=1;
    A[8][12]=1;A[12][8]=1;
    A[12][13]=4;A[13][12]=4;
    A[13][14]=4;A[14][13]=4;
    A[14][15]=1;A[15][14]=1;
    A[14][16]=2;A[16][14]=2;
    A[16][17]=1;A[17][16]=1;
    A[16][18]=4;A[18][16]=4;
    A[18][19]=4;A[19][18]=4;
    A[19][20]=1;A[20][19]=1;
    A[19][12]=1;A[12][19]=1;
    A[20][21]=1;A[21][20]=1;
    A[20][29]=1;A[29][20]=1;
    A[20][24]=1;A[24][20]=1;
    A[21][22]=1;A[22][21]=1;
    A[21][23]=1;A[23][21]=1;
    A[24][25]=2;A[25][24]=2;
    A[25][26]=3;A[26][25]=3;
    A[26][27]=1;A[27][26]=1;
    A[26][28]=2;A[28][26]=2;
    A[28][29]=1;A[29][28]=1;
    //A[28][3]=7;A[3][28]=7;
    A[29][1]=1;A[1][29]=1;	
    
    //_put_value(START_POINT);
    //_put_value(END_POINT);
    
    sV=START_POINT;
    a=END_POINT;
    if(sV==a){
    	path_planned[0]=sV;
    	idx=1;
	}
    else{
    	
	
    
   	
	//if(((sV>=0)&&(sV<30))&&((a>=0)&&(a<30)))
	
    
    const int nVertices = 30;
    int shortDisarray[nVertices];
    int added[30] = {0};
    for (int verInd = 0; verInd < nVertices; verInd++) {
        shortDisarray[verInd] = 2147483647;
        added[verInd] = 0;
    }
    shortDisarray[sV] = 0;
    int parents[30] = {0};
    parents[sV] = -1;
    for (int i = 1; i < nVertices; i++) {
        int nearestVertex = -1;
        int shortestDistance = 2147483647;
        for (int verInd = 0; verInd < nVertices; verInd++) {
            if (!added[verInd] && shortDisarray[verInd] < shortestDistance) {
                nearestVertex = verInd;
                shortestDistance = shortDisarray[verInd];
            }
        }
        added[nearestVertex] = 1;
        for (int verInd = 0; verInd < nVertices; verInd++) {
            int edgeDistance = A[nearestVertex][verInd];
            if (edgeDistance > 0 && ((shortestDistance + edgeDistance) < shortDisarray[verInd])) {
                parents[verInd] = nearestVertex;
                shortDisarray[verInd] = shortestDistance + edgeDistance;
            }
        }
        
        
    }
    
    int verInd = a;
    if (verInd != sV) {
        while(verInd!=-1){
            path_planned[cnt]=verInd;
            cnt++;
            k=cnt;
            verInd=parents[verInd];
        }
    }
     idx=k;
    
    int temp;
    for(int i = 0; i<k/2; i++){
        temp = path_planned[i];
        path_planned[i] = path_planned[k-i-1];
        path_planned[k-i-1] = temp;
    }
}

    // ##############################################

    #ifdef __linux__    // for host pc

        _put_str("######### Planned Path #########\n");
        for (int i = 0; i < idx; ++i) {
            _put_value(path_planned[i]);
        }
        _put_str("################################\n");
    

    #endif 
	
	
	/*else{
		_put_str("Invalid points");
	}*/

    return 0;
}
