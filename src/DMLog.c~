#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <errno.h>
#include <signal.h>
#include <stdarg.h>
#include <string.h>
#include <queue>
#include <string>


#include "logutility.h"


const char * DM_ERROR_MSG =   "<DM_LOG_ERROR>   :";
const char * DM_WARNING_MSG = "<DM_LOG_WARNING> :";
const char * DM_TRACE_MSG =   "<DM_LOG_TRACE>   :";
const char * DM_INFO_MSG =    "<DM_LOG_INFO>    :";


FILE *fp;
std::queue<char*> logQueue;
pthread_mutex_t     mutex = PTHREAD_MUTEX_INITIALIZER;



static void * thread_start(void *arg)
{
    printf("Inside new thread \n"); 


    while(1)
    {
	//printf("Trying to get lock\n");        
	pthread_mutex_lock(&mutex);
        //printf("got LOCK \n"); 
	
        if(!logQueue.empty())
        {
 	    //printf("Found elem in queue \n");
            //printf("Size of queue :%d \n", logQueue.size());
            //char *str = new char[strlen(logQueue.front()) * sizeof(char)];
	    //str = strdup(logQueue.front()); 
            printf("Message from queue is: %s\n",logQueue.front());
	    logQueue.pop();
            pthread_mutex_unlock(&mutex);
 	    
        }
	else
        {  
          //printf("Queue empty - Releasing lock\n");
          pthread_mutex_unlock(&mutex);
        }
        

        sleep(1);
    }
    return NULL;
}


pthread_t t;

int initLogger()
{
    int s;
    pthread_attr_t attr;
    
    s = pthread_attr_init(&attr);
    if( s != 0)
    {
	fprintf(stderr,"Failed to init logger thread: %s\n", strerror(errno));
        return 1;
    }    

    s = pthread_create(&t, &attr,&thread_start, NULL);
    if(s != 0)
    {
	fprintf(stderr,"Failed to create logger thread: %s\n", strerror(errno));
        return 1;
    }

    s = pthread_detach(t);
    if(s != 0)
    {
	fprintf(stderr,"Failed to detach thread: %s\n", strerror(errno));
        return 1;
    }

    
    return 0;
}




void DMLog(DMLogLevel logLevel, char *format, ...)
{
    va_list arglist;
    char * buffer = (char*) malloc(256);
    char *temp = (char*) malloc(256); 

    if(!buffer)
    {
        fprintf(stderr,"Failed to malloc buffer: %s\n", strerror(errno));
        return;
    }

    switch(logLevel)    
    {

	case DM_LOG_ERROR:
                
		strncpy(temp,DM_ERROR_MSG, strlen(DM_ERROR_MSG));
		//printf("TEMP : %s\n\n", temp);
                strncat(temp,format, strlen(format));
                //printf("<><><>< TEMP ::::: %s\n",temp );
		//strcat();
		//pthread_kill(t,SIGUSR1);
                break;

        case DM_LOG_WARNING:
		strncpy(temp,DM_WARNING_MSG, strlen(DM_WARNING_MSG));
                strncat(temp,format, strlen(format));
		//printf(" TEMP ::::: %s\n",temp );

                break; 

        case DM_LOG_TRACE:
		strncpy(temp,DM_TRACE_MSG, strlen(DM_TRACE_MSG));
                strncat(temp,format, strlen(format));
		//printf(" TEMP ::::: %s\n",temp );
                break;		

        case DM_LOG_INFO:
		strncpy(temp,DM_INFO_MSG,strlen(DM_INFO_MSG));
                strncat(temp,format, strlen(format));
		//printf(" TEMP ::::: %s\n",temp );
                break;

	default:
		break;
    }    

    va_start( arglist, temp );
    vsprintf( buffer,temp, arglist);
    va_end( arglist );
	    
    	
    pthread_mutex_lock(&mutex);
    logQueue.push(buffer);   
    //printf("Pushed to queue\n");
    pthread_mutex_unlock(&mutex);

    

	
}

