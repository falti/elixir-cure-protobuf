#include <iostream>
#include <fstream>
#include <string>
#include "main.h"

using namespace std;

int main(void)
{
    GOOGLE_PROTOBUF_VERIFY_VERSION;

    int bytes_read;
    byte buffer[MAX_BUFFER_SIZE];

    while((bytes_read = read_msg(buffer)) > 0)
    {
        // TODO put C-code here, right now it only echos data back
        // to Elixir.
        foo::User user;
        user.ParseFromArray(buffer, bytes_read);

        user.set_first_name("Larrylallo");
        int target_size = user.ByteSize();
        byte buffer2[target_size];
        user.SerializeToArray(buffer2, target_size);

        send_msg(buffer2, target_size);
    }

    return 0;
}
