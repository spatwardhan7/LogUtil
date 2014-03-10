#include <stdio.h>
#include <stdlib.h>

#include "logutility.h"




void DMLog(DMLogLevel logLevel, char *format, ...)
{

    printf("Log Call received with log level: %d  and MSG : %s \n", logLevel, format);
}

