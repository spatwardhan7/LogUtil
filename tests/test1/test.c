#include <stdio.h>
#include "logutility.h"



static void * thread_start(void *arg)
{
    printf("new thread in test started\n"); 

    char detail[]= "Detail string ";
    int count = 0;
    int LOG_TYPE = 0;

    while(1)
    {
         sleep(2);
         LOG_TYPE = count %4;

	 DMLog((DMLogLevel)LOG_TYPE,"LOG TYPE %d FROM thread in test %d and str %s\n", (DMLogLevel)LOG_TYPE,count,detail);
         count++;

    }
    return NULL;
}


int main(int argc, char* argv[])
{
	
    if(initLogger())
        return 1; 

    DMLog(DM_LOG_ERROR,"Initial Test message version 0.000001 %d",5);

    printf("\n in test - DMLOG returned\n");


    pthread_attr_t attr;

    pthread_t t;
    
    pthread_attr_init(&attr);    

    pthread_create(&t, &attr,&thread_start, NULL);


    while(1)
    {}

  

    
    
    return 0;
}
