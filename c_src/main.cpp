#include <iostream>
#include <fstream>
#include <string>
#include <elixir_comm.h>
#include "user.pb.h"

//using namespace std;


int main(int argc, char* argv[])
{
  // Verify that the version of the library that we linked against is
  // compatible with the version of the headers we compiled against.


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
