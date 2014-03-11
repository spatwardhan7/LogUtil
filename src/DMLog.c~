#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <errno.h>
#include <signal.h>
#include <stdarg.h>
#include <string.h>
#include <queue>


#include "logutility.h"


const char * DM_ERROR_MSG =   "<DM_LOG_ERROR>   :";
const char * DM_WARNING_MSG = "<DM_LOG_WARNING> :";
const char * DM_TRACE_MSG =   "<DM_LOG_TRACE>   :";
const char * DM_INFO_MSG =    "<DM_LOG_INFO>    :";

std::queue<char*> logQueue;
pthread_mutex_t     mutex = PTHREAD_MUTEX_INITIALIZER;
FILE *fp;
pthread_t aggressive_t;
sigset_t waitset;
siginfo_t info;

static void consumeFromQueue()
{
	pthread_mutex_lock(&mutex);	
    if(!logQueue.empty())
    {
        char *str = logQueue.front(); 
	    logQueue.pop();
        pthread_mutex_unlock(&mutex);
        if(LOG_TO_FILE == 1)
        {
            fprintf(fp,"%s\n",str);
            fflush(fp);
        }
        if(LOG_TO_CONSOLE == 1)
            printf("%s\n",str);    
    }
	else
    {  
        pthread_mutex_unlock(&mutex);
    }

}

static bool isQueueEmpty()
{
    bool bEmpty = false;
    pthread_mutex_lock  (&mutex);
    bEmpty = logQueue.empty() ? true : false;
    pthread_mutex_unlock(&mutex);
    return bEmpty;
}

static void * aggressiveConsumer(void *arg)
{
    //printf("Inside new thread \n"); 

    // Run infinitely
    int result = 0;
    while(1)
    {
        // Wait for error to happen
        //    sigWaitInfo();
        result = sigwaitinfo( &waitset, &info );
        if( result == 0 )
            printf( "sigwaitinfo() returned for signal %d\n",info.si_signo );
        printf("HERE\n");
        while(!isQueueEmpty())
        {        
            consumeFromQueue();
        }
    }
    return NULL;
}


static void * periodicConsumer(void *arg)
{
    //printf("Inside new thread \n"); 

    struct timespec ts;
    ts.tv_sec = 0;
    ts.tv_nsec = TIMER_MS * N_SEC_TO_M_SEC;

    while(1)
    {        
        consumeFromQueue();
        nanosleep(&ts,NULL);
    }
    return NULL;
}

static int openLogFile()
{
    if(LOG_TO_FILE == 1)
    {
        time_t t = time(NULL);
	    struct tm tm= *localtime(&t);	
        char buffer[100];
 
        snprintf(buffer,100,"%d-%d-%d-%d-%d-%d.txt", tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec);

    	fp = fopen(buffer,"w");
	    if(!fp)
        {
	        fprintf(stderr,"Failed to open log file: %s\n", strerror(errno));
               return 1;   
        }
    }
    return 0;
}

static int createThread(pthread_t *thread,pthread_attr_t *attr, void *(*start_routine) (void *))
{
        
    if(pthread_attr_init(attr))
    {
	    fprintf(stderr,"Failed to init logger thread: %s\n", strerror(errno));
        return INIT_LOGGER_FAILED;
    }    
    
    if(pthread_create(thread, attr,start_routine, NULL))
    {
	    fprintf(stderr,"Failed to create logger thread: %s\n", strerror(errno));
        return INIT_LOGGER_FAILED;
    }

    if(pthread_detach(*thread))
    {
	    fprintf(stderr,"Failed to detach thread: %s\n", strerror(errno));
        return INIT_LOGGER_FAILED;
    }

    return INIT_LOGGER_OK; 
}

void catcher( int sig ) {
    printf( "Signal catcher called for signal %d\n", sig );
}

int initLogger()
{
    
    struct sigaction sigact;
    sigemptyset( &sigact.sa_mask );
    sigact.sa_flags = 0;
    sigact.sa_handler = catcher;
    sigaction( SIGUSR1, &sigact, NULL );

    sigemptyset( &waitset );
    sigaddset( &waitset, SIGUSR1);

    sigprocmask( SIG_BLOCK, &waitset, NULL );




    pthread_attr_t attr;
    pthread_t periodic_t;
    

    if(createThread(&periodic_t,&attr,&periodicConsumer))
        return INIT_LOGGER_FAILED;
   
    if(createThread(&aggressive_t,&attr,&aggressiveConsumer))
        return INIT_LOGGER_FAILED;

    if(LOG_TO_FILE == 1)
    {
        if(openLogFile())
            return INIT_LOGGER_FAILED; 
    }

    return 0;
}

void DMLog(DMLogLevel logLevel, char *format, ...)
{
    va_list arglist;
    char *buffer = (char*) malloc(256);
    char *temp = (char*) malloc(256); 

    if(buffer == NULL || temp == NULL)
    {
        fprintf(stderr,"Failed to malloc buffer: %s\n", strerror(errno));
        return;
    }

    switch(logLevel)    
    {

	case DM_LOG_ERROR:
		strncpy(temp,DM_ERROR_MSG, strlen(DM_ERROR_MSG));
                break;

        case DM_LOG_WARNING:
		strncpy(temp,DM_WARNING_MSG, strlen(DM_WARNING_MSG));
                break; 

        case DM_LOG_TRACE:
		strncpy(temp,DM_TRACE_MSG, strlen(DM_TRACE_MSG));
                break;		

        case DM_LOG_INFO:
		strncpy(temp,DM_INFO_MSG,strlen(DM_INFO_MSG));
                break;

	default:
		break;
    }    

    strncat(temp,format, strlen(format));
    va_start( arglist, temp );
    vsprintf( buffer,temp, arglist);
    va_end( arglist );
	    
    	
    pthread_mutex_lock(&mutex);
    logQueue.push(buffer);   
    pthread_mutex_unlock(&mutex);

    if(logLevel == DM_LOG_ERROR)
        pthread_kill(aggressive_t,SIGUSR1);

    free(temp);	
}

