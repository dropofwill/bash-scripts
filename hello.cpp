#include <iostream>
#include <fstream>
#include <ctime>
using namespace std;

int main()
{
   time_t rawtime;
   struct tm * timeinfo;
   char buffer[80];

   time (&rawtime);
   timeinfo = localtime(&rawtime);

   strftime(buffer, 80, "%d-%m-%Y %I:%M:%S", timeinfo);
   string str(buffer);

   cout << "Current time is " + str + "\n";
   
   string line;
   ifstream dist ("/etc/lsb-release");
   if(dist.is_open())
   {
     while(dist.good())
     {
        getline(dist, line);
        cout << line << endl;
     }
     dist.close();
   }

   return 0;
}
