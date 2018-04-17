# nectar openstack scripts

- Should have Python; if not:

    ```
    brew install python@2
    ```

- Install `virtualenv` and prepare `.venv`

    ```
    bash install.sh
    ```
    
- Populate tenants/projects name in `list.txt`

- Create `.username` file and add login name there e.g.:
    
    ```
    echo "my.nectar.login@unimelb.edu.au" > .username
    ```

- Get [the NeCTAR OpenStack Password](https://support.ehelp.edu.au/support/solutions/articles/6000145832-the-nectar-openstack-password)

    To obtain or reset-and-obtain your NeCTAR OpenStack password using the NeCTAR Dashboard:
    
    - navigate to and sign in to your NeCTAR Dashboard
    - click on your user name in the top right of the screen
    - select "Settings" from the drop down menu
    - navigate on to the Password Reset Form by clicking the Reset Password tab on the left hand side of the screen 
    - on the Password Reset Form click the Reset Password button. There will be NO confirmation asked.
    
    The Password Reset Form will now display your new generated password to you.

- Create `.passwd` file and add the password there e.g.:

    ```
    echo "My-PASSWORD-GENERATED-FROM-DASHBOARD" > .passwd
    ```

- Then run the `checkup.sh`

    ```
    bash checkup.sh
    ```
    
EoF