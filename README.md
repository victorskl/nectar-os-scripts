# NeCTAR OpenStack Scripts

How to NeCTAR OpenStack CLI clients and miscellaneous utility scripts that wrap around of this.

## Setup

- Git checkout or [download in zip](https://github.com/victorskl/nectar-os-scripts/archive/master.zip)

    ```
    git clone https://github.com/victorskl/nectar-os-scripts.git
    cd nectar-os-scripts
    ```

- Should have Python; if not:

    ```
    brew install python@2
    ```

- Install `virtualenv` and prepare `.venv`

    ```
    bash install.sh
    ```
    
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
    
    The Password Reset Form will now display your newly generated password to you.
    
    You cannot view your existing password. It will only be shown to you when you first generate it. It is up to you to remember or manage your password well.
    
    Resetting your password generates a new password for you to use and manage. Any API applications or CLI scripts or service provider accounts you may have created in the past, that are set up with the old password will be denied API/CLI/service access until you configure them to use your new password.

    ___Note: You can generate as many time as you like. The successive  password will revoke all previous ones.___

- Create `.passwd` file and add the password there e.g.:

    ```
    echo "My-PASSWORD-GENERATED-FROM-DASHBOARD" > .passwd
    ```

## Usage

### Checkup Instances in Projects

- Populate tenants/projects name in `list.txt`

- Run the `checkup.sh`

    ```
    bash checkup.sh
    ```
   
### Using OpenStack clients directly

- Source the `env.sh`
    
    ```
    source env.sh
    ```
    
- Using Nova

    ```
    nova --os-project-name=CCC2018-18 list
    ```

- Using OpenStack

    ```
    openstack project list
    
    echo $OS_USERNAME
    openstack user show $OS_USERNAME
    ```

- Export default project/tenancy

    ```
    export OS_PROJECT_NAME=CCC2018-18
    ```

- Then

    ```
    nova list
    cinder list
    
    openstack server list
    openstack volume list
    
    openstack help
    ```


---

REF

- https://docs.openstack.org/newton/user-guide/cli.html
- https://docs.openstack.org/python-openstackclient/latest/