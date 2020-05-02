NODES="192.168.43.153 192.168.43.154"
CERTS=$(find /etc/kubernetes/pki/ -maxdepth 1 -name '*ca.*' -o -name '*sa.*')
ETCD_CERTS=$(find /etc/kubernetes/pki/etcd/ -maxdepth 1 -name '*ca.*')
for NODE in $NODES; do
  ssh ubuntu@$NODE mkdir -p /etc/kubernetes/pki/etcd
  scp $CERTS ubuntu@$NODE:/etc/kubernetes/pki/
  scp $ETCD_CERTS ubuntu@$NODE:/etc/kubernetes/pki/etcd/
  scp /etc/kubernetes/admin.conf $NODE:/etc/kubernetes
done
