for i in `cat csr.txt`
do
openssl req -text -noout -verify -in $i
done
