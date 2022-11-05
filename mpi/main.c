#include <stdio.h>
#include <string.h>
#include <mpi.h>


int main(void) {
    char greeting[100];
    int comm_sz;    // number of processes
    int my_rank;    // my process rank

    MPI_Init(NULL, NULL);   
    // When you call MPI_Init, you are telling MPI to start up. 
    // Creating a communicator
    // usage: MPI_Init(int *argc, char ***argv)
                            
    MPI_Comm_size(MPI_COMM_WORLD, &comm_sz);
    // MPI_Comm_size returns the number of processes in the communicator
    // usage: MPI_Comm_size(MPI_Comm comm, int *size)

    MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);

    if (my_rank != 0) {
        sprintf(greeting, "Greetings from process %d of %d!", my_rank, comm_sz);
        MPI_Send(greeting, strlen(greeting)+1, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
    } else {
        printf("Greetings from process %d of %d!\n", my_rank, comm_sz);
        for (int q = 1; q < comm_sz; q++) {
            MPI_Recv(greeting, 100, MPI_CHAR, q, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
            printf("%s, \n", greeting);
        }
    }

    MPI_Finalize();
    return 0;
}