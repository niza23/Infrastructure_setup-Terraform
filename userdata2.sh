#!/bin/bash
# Update packages and install Apache
apt update -y
apt install -y apache2 awscli


# Create a simple HTML page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>My Portfolio</title>
  <style>
    @keyframes colorChange {
      0% { color: red; }
      50% { color: green; }
      100% { color: blue; }
    }
    h1 { animation: colorChange 2s infinite; }
  </style>
</head>
<body>
  <h1>Terraform Project Server 2</h1>
  <h2>Instance ID: <span style="color:green">$INSTANCE_ID</span></h2>
  <p>HI welcome to 1</p>
</body>
</html>
EOF

# Start and enable Apache
systemctl enable apache2
systemctl start apache2