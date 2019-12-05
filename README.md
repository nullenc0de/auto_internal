Install Crackmapexec:
apt-get install -y libssl-dev libffi-dev python-dev build-essential
pip install --user pipenv
git clone --recursive https://github.com/byt3bl33d3r/CrackMapExec
cd CrackMapExec && python -m pipenv install
pythom -m pipenv shell
python setup.py install

Install ldapdomaindump
pip3 install ldapdomaindump

Install adidnsdump
pip3 install adidnsdump
