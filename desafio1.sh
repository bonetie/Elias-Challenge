awk '$1 != IpAddress{ print }{ IpAddress = $1 }' control_file.txt >/tmp/output_1.txt
