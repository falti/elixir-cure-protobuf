#include "main.h"

int main(void)
{
    int bytes_read;
    byte buffer[MAX_BUFFER_SIZE];
    
    while((bytes_read = read_msg(buffer)) > 0)
    {
        // TODO put C-code here, right now it only echos data back
        // to Elixir.

        send_msg(buffer, bytes_read);
    }

    return 0;
}
