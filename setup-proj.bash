####
# last modified: by christos faloutsos, Jan. 2016
####

PREFIX=826-proj    # you may leave it as-is - but created such a dir. first
POSTGRESPORT=5432  # you SHOULD change it according to your port# on Blackboard

cd $PREFIX
PREFIX=`pwd`
wget https://github.com/postgres/postgres/archive/master.zip
unzip master.zip
rm -f master.zip
cd postgres-master
./configure --prefix=$PREFIX/postgres/
make -j 2
make install
cd $PREFIX
rm -rf postgres-master
./postgres/bin/initdb -D $PREFIX/postgres/data/
./postgres/bin/postgres -p $POSTGRESPORT -D $PREFIX/postgres/data/ >logfile 2>&1 &
sleep 3
./postgres/bin/psql -U `whoami` -p $POSTGRESPORT -d postgres -c "ALTER USER `whoami` WITH PASSWORD 'password'"
export PATH=$PREFIX/postgres/bin/:$PATH
echo "export PATH=$PREFIX/postgres/bin/:$PATH" >> $HOME/.bashrc

wget https://pypi.python.org/packages/source/p/psycopg2/psycopg2-2.5.4.tar.gz
tar -xvf psycopg2-2.5.4.tar.gz
rm -f psycopg2-2.5.4.tar.gz
cd psycopg2-2.5.4
python setup.py install --home=$PREFIX
export PYTHONPATH=$PREFIX/lib/python
echo "export PYTHONPATH=$PREFIX/lib/python" >> $HOME/.bashrc
export POSTGRESPORT=$POSTGRESPORT
echo "export POSTGRESPORT=$POSTGRESPORT" >> $HOME/.bashrc
cd $PREFIX
rm -rf psycopg2-2.5.4

wget http://www.cs.cmu.edu/~christos/courses/826.S16/project-default-graphs/graphminer.tar.gz
tar -xvf graphminer.tar.gz
rm -f graphminer.tar.gz
cd graphminer
sed -i "s/^GM_DB_USER.*/GM_DB_USER = \"`whoami`\"/" gm_params.py
sed -i "s/^GM_DB_PORT.*/GM_DB_PORT = $POSTGRESPORT/" gm_params.py
make all
