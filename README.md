# Computational Genomics

How to run the code in https://github.com/mominbuet/SecureApproxEditDistance
---
1. Choose an ubuntu. (CS cluster runs on Fedora, so they don't work.)

2. In the folder SecureApproxEditDistance, chmod +x *.sh *.exe

3. Clean and build the project.

4. Run the code using ``./run_server.sh db1.fa 2 & ./run_researcher.sh query.fa 2 127.0.0.1 20'' (Use run_server.sh instead of runserver.sh).

5. If there are any errors during the execution, completely delete the folder and download it again. (mvn doesn't work well).