#!/usr/bin/env bash


function main() {
    if command -v python &>/dev/null; then

        echo "Python is installed... "
        which python
        python -V
        which pip
        pip -V
        echo ""

        echo "Installing virtualenv module..."
        pip install virtualenv
        echo ""

        echo "Creating virtual Python .venv..."
        python -m virtualenv .venv
        echo ""

        echo "Install OpenStack SDK..."

        #source ./.venv/bin/activate

        .venv/bin/pip install -r requirements.txt

        #deactivate

    else
        echo "Python is not installed. Try 'brew install python@2'"
    fi
}

main "$@"