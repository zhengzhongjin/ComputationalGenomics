# Computational Genomics

How to run the code in https://github.com/mominbuet/SecureApproxEditDistance
---
1. git clone https://github.com/mominbuet/SecureApproxEditDistance

The ip address in PSI is hard-coded in PSI/src/mains/psi_demo.cpp . We need to change it to 127.0.0.1. Hence, we will rebuild the PSI project. But the clone in SecureApproxEditDistance/PSI is incomplete. (SecureApproxEditDistance/PSI/src/externals is missing).

So we need to fix the missing files first.

2. git --recursive clone https://github.com/encryptogroup/PSI

cd to the PSI project folder, and rollback to the old version of PSI (at 2015)

3. git checkout 8c1bafe

4. Build the old version PSI.

5. cp -r PSI/src/externals SecureApproxEditDistance/PSI/src/

6. Change the ip address in SecureApproxEditDistance/PSI/src/mains/psi_demo.cpp (line 23) to 127.0.0.1. make clean and rebuild in the PSI folder.

7. Copy the SecureApproxEditDistance/PSI/demo.exe and SecureApproxEditDistance/PSI/psi.exe to the folder SecureApproxEditDistance.

8. In the folder SecureApproxEditDistance, add the execution permission `chmod +x *.sh *.exe'.

9. mvn clean & mvn build

10. Run the code using ``./run_server.sh db1.fa 2 & ./run_researcher.sh query.fa 2 127.0.0.1 10'' (Use run_server.sh instead of runserver.sh).
 
11. If there are any errors during the execution, completely delete the folder and download it again. (mvn doesn't work well).
