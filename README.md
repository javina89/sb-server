# sb-server  
Start up script  
  
To use this script:  
  
1. Navigate to the directory where these files are located  
2. Make the scripts executable and run them in order by typing:   
    sudo chmod +x setup1.sh && sudo ./setup1.sh  
    sudo chmod +x setup2.sh && sudo ./setup2.sh   

Then  
  
Insert or update files:  
    1. Update nginx.conf in /home/${USERNAME}/nginx/  
    2. Update the .env files in /home/$USER1/$SITE1/.env, etc  
    3. Run addNodejs.sh to add nodejs apps
    4. Run addSite.sh to add frontend apps 
  
Refer to maintenance.md on maintaining the server and applications.