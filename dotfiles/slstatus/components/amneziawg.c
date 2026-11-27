#include <stdio.h>
#include <unistd.h>
#include <limits.h>

#include "../slstatus.h"
#include "../util.h"

const char *
amneziawg_status(const char *interface)
{
	char path[PATH_MAX];

	if (esnprintf(path, sizeof(path), "/sys/class/net/%s", interface) < 0)
		return NULL;

	if (access(path, F_OK) == 0)
		return bprintf("󰝥");

	return bprintf("󰝦");
}

