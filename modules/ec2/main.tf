resource "aws_security_group" "wordpress_sg" {
  name = "allow_traffic"
  description = "Allow SSH and HTTP inbound and all outbound traffic"

  tags = {
    Name = "allow_traffic"
  }

  ingress{
    from_port = var.http_ports
    to_port = var.http_ports
    protocol = "tcp"
    cidr_blocks = var.cidr_allow
  }

  ingress{
    from_port = var.ssh_ports
    to_port = var.ssh_ports
    protocol = "tcp"
    cidr_blocks = var.cidr_allow
  }

  egress{
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = var.cidr_allow
  }
}

resource "aws_instance" "wordpress" {
    ami = local.ami
    instance_type = local.instance_type
  
  vpc_security_group_ids = [aws_security_group.wordpress_sg.id]
  tags = {
    Name = "Wordpress"
  }


   user_data = <<-EOF
          #!/bin/bash
          set -e

          apt update -y
          apt install apache2 php php-mysql wget unzip mysql-client -y

          # Create the WordPress database
          mysql -h ${var.db_host} -u ${var.db_user} -p${var.db_password} -e "CREATE DATABASE IF NOT EXISTS wordpress;"

          cd /var/www/html
          cd /var/www/html
          rm -f index.html
          wget https://wordpress.org/latest.tar.gz
          tar -xvzf latest.tar.gz
          cp -R wordpress/* .
          chown -R www-data:www-data /var/www/html
          chmod -R 755 /var/www/html
          rm -rf wordpress latest.tar.gz

          cat > /var/www/html/wp-config.php <<EOL
          <?php
          define('DB_NAME', 'wordpress');
          define('DB_USER', '${var.db_user}');
          define('DB_PASSWORD', '${var.db_password}');
          define('DB_HOST', '${var.db_host}');
          define('DB_CHARSET', 'utf8');
          define('DB_COLLATE', '');
          \$table_prefix = 'wp_';
          define('WP_DEBUG', false);
          if ( !defined('ABSPATH') )
              define('ABSPATH', dirname(__FILE__) . '/');
          require_once(ABSPATH . 'wp-settings.php');
          ?>
          EOL

          systemctl restart apache2
        EOF
}