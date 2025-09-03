BTP-R880NPII - installation on linux

Copyright 2014 SNBC
================================



1.    System Requirements
-------------------------

For the operation of the printer in Linux you need as a minimum requirement 
the Linux kernel 2.6.21 or later, and CUPS 1.3.0 or higher.



2.    Installing CUPS
---------------------

  - Charge of CUPS on http://www.cups.org/software.php down.
  - Extract this cups-x.x.x-source.tar.gz file creating cups-x.x.x directory  
  - Navigate to this cups-x.x.x directory
  - Type './configure' at the prompt to config the package
  - Type 'make' to begin building the pacakge
  - Type 'make install' to install this CUPS onto your computer.



3.    Installing the printer driver
-----------------------------------

After you install CUPS, you can install the printer driver.

Use the following traballs for your specific platform:
  - R880NPII_x86: drivers for Linux x86, R880NPII_x64: drivers for Linux x64
   	- R880NPII.tar: drivers for BTP-R880NPII with parallel,USB or Ethernet interface.
  	- R880NPIIs.tar: drivers for BTP-R880NPII with serial interface.  	
 
Both drivers support printer, parallel, serial, USB and Ethernet Interface.

Please go to the instalation as follows:
  - Extra the appropriate tarball into a directory.
  R880NPIIp.tar:
  - copy file rastertoR880NPII  to /usr/lib/cups/filter.
  - copy file R880NPII.ppd      to /usr/share/cups/model.
  R880NPIIs.tar:
  - copy file rastertoR880NPIIs  to /usr/lib/cups/filter.
  - copy file R880NPIIs.ppd      to /usr/share/cups/model. 
  
   - Restart CUPS



4.    Printer Mode and API Mode
-------------------------------

To install the USB driver on Linux, the printer must be printer mode. 
If the printer is in API mode, then convering API mode into printer mode.
  - The Printer Mode Manager V1.21 for Windows(32-bit).
    Run PrinterModeManager.exe,select "Receipt" in "Select Printer Type",
then click "Printer Mode" to change USB mode.

  - The Printer Mode Manager V1.0 for Linux(32-bit).
    PrintModeManager_Linux_x32 V1.0.tar is used for converting printer mode on Linux.



5.    Add printer in CUPS(For example:FC8)
------------------------------------------
  - navigate to 'http://localhost:631' via Netscape Navigator.
  - Click on the link that reads 'Administration'.
  - Click on the link that reads 'Add printer'.
  - Fill in the Name, Location, and Description fields as desired.
  - Choose the port that the printer is connected to from the choice box.
    For printer with parallel interface, the port is LPT #1;
    For printer with serial interface, the port is Serial Port #1;
    For printer with USB interface, the port is SNBC BTP-R880NPII(U)1 USB #1(SNBC BTP-R880NPII(U)1);
  - Click on the link that reads 'Continue'.
  - Select 'SNBC' from the Make box. Click on the link that reads 'Continue'.
  - Choose the model of printer being installled (SNBC BTP-R880NPII CUPS v1.0), 
click on the link that reads 'Add Pritner'.
  - When prompted for the User ID and Password, enter a User ID for the Linux system 
that has administrative rights (or root not other user). 

Your printer can be used.
 

5.a  printer with Ethernet interface
------------------------------------

For printers with Ethernet interface in CUPS select the "Internet Printing
Protocol (ipp) "and enter the connection string (Device URI)
"Socket / <ip-addr> /: 9100" on, so for example "Socket://192.168.19.255:9100".


5.b  printer with serial interface
----------------------------------

If you use the printer to the serial port and access problems identify the device, please try the following:
  - Open a console window, log in as root and type 'chmod a+rwx /dev/ttyS0' to change its property.
  - Make sure that the serial connection for the flow control RTS /CTS used (hardware flow control).


6.    History
    
  - V1.0
	Release date: 3/15/2014(MM/DD/YYYY)
	Changes:      First release.

