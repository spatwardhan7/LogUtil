#ifndef LOGUTILITY_H_INCLUDED
#define LOGUTILITY_H_INCLUDED


#define LOG_TO_FILE      1    
#define LOG_TO_CONSOLE   1
#define DM_NUM_CORES     2
#define N_SEC_TO_M_SEC   1000000
#define TIMER_MS         100

#define INIT_LOGGER_OK       0
#define INIT_LOGGER_FAILED   0

#include <pthread.h>
#include <unistd.h>

typedef enum
{
    DM_LOG_ERROR,
    DM_LOG_WARNING,
    DM_LOG_TRACE,
    DM_LOG_INFO
}DMLogLevel;


int initLogger();
void DMLog(DMLogLevel logLevel, char *format, ...);

#endif /* LOGUTILITY_H_INCLUDED*/
