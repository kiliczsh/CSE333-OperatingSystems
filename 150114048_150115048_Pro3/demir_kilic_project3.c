/**
Compile:	gcc demir_kilic_project3.c -o demir_kilic_project3 -pthread
Run:		./demir_kilic_project3 -d <directory> -n <number of threads>

*/



#include <stdio.h>
#include <pthread.h> 
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int indexFile=0;
int hedefI;
char hedefArray[1200][100];
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;


struct thread_data
{
   char path[100];
   char text[100];
   int 	index;
   int write;
};

int searchInDestArray(char *word)
{
    int i = 0;
    while(i<hedefI)
    {
	if(strcmp(hedefArray[i], word) == 0)
	{
		return i;
	}
	i++;
    }
return -1;

}



void *PrintHello(void *threadarg)
{
    	struct thread_data *my_data;
   	my_data = (struct thread_data *) threadarg;
        FILE *fp2;
	fp2 =fopen(my_data -> path,"r");

    while( fscanf(fp2, "%s", my_data->text) != EOF )
    {
            	pthread_mutex_lock(&mutex); // mutex lock 
			if(searchInDestArray(my_data->text) == -1)
			{
				my_data->index = hedefI;
				my_data->write = 1;
				hedefI++;
			}
			else
			{
			   printf("The word \'%s\' has already located at index %d\n",my_data->text,
											searchInDestArray(my_data->text));
				my_data->write = 0;
			}
        	pthread_mutex_unlock(&mutex); // mutex unlock

        	if(my_data->write == 1)
        	{
        			strcpy(hedefArray[my_data->index],my_data->text);
				printf("THREAD %ld : Added \'%s\' at index %d\n",pthread_self(),my_data->text,hedefI);
        	}

     }
        fclose(fp2);
        pthread_exit(NULL);
}





int main( int argc, char *argv[] )
{

// error check
if (argc != 5){   /* check for valid number of command-line arguments */
      fprintf (stderr, "Usage: ./demir_kilic_projec3.out -d <directory> -n <threadnumber>\n");
      return 1;
  }
    char path2[1035][1035];
    FILE *fp;
    char path[1035];
    chdir(argv[2]);
    char deneme[200] = "ls *.txt";
    fp = popen(deneme, "r");
    if (fp == NULL) 
    {
        printf("Failed to run command\n" );
        exit(1);
    }

    /* Read the output a line at a time - output it. */
// important declarations
    int numberOfFile = 0;
    int numberOfThread = atoi(argv[4]);

    while (fgets(path, sizeof(path)-1, fp) != NULL) 
    {
	    strcpy(path2[numberOfFile] , path);
	    numberOfFile++;
    }


    int index = 0;
// putting text files to the array
    while(index<numberOfFile)
    {
	char *temp = malloc(500);
        strcpy(temp, path2[index]);
 	char *s = temp;
        while(*s != NULL)       
       {
			if(*s == '\n')
			{
				*s = '\0';
			}
			s++;
	}
	strcpy(path2[index],temp);

    	index++;
    }

    struct thread_data threadDataArray[numberOfThread];


// assigning files to worker threads
    	if(numberOfFile)
	{
		printf("MAIN THREAD: Allocated initial array of 8 pointers\n");
		pthread_t threads[numberOfThread];
		int rc;
		int t;
		int a;
		while(indexFile<numberOfFile)
		{
			a = 0;
		  	while(a<numberOfThread)			
			{
				if(indexFile == numberOfFile)
				{
					break;
				}
				threadDataArray[a].write = 0;
				strcpy(threadDataArray[a].path,path2[indexFile]);
		  		rc = pthread_create(&threads[a], NULL, PrintHello, (void *)&threadDataArray[a]);
				printf("----->MAIN THREAD: Assigned \'%s\' to worker thread %ld\n",path2[indexFile],threads[a]);
				indexFile++;
				a++;	
			}
         		for(t=0;t<numberOfThread;t++)
			{
			    pthread_join(threads[t],NULL);
			}
	        }
	  
		int son = 0;
		while(son < hedefI)
		{
		    printf("Target Array: %d. = %s\n",son,hedefArray[son]);
		    son++;
		}
	}
	else
	{
	    perror("\nError\n");
	}
    pclose(fp);
    return 0;



}
