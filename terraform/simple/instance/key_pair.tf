resource "aws_key_pair" "app_server_key_pair" {
  key_name = "app_server"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCZJMmoP/dQYIlsCGHOGouHJkhg9cEgt/my08SK66gfqOPoJFxIbVJs0PkTlNZv83TWPYX+GHLvXyst9aQAryN/YG/Rm+asH/q6oe9AspY7dch1Z3k2ajS8yD24RWJLtqqAoMz+enR6ky/9TJ2bFTcOy3tQuCKdWwDwh7sJuvCIEthewf1szQ1oPk9JmcKQUDxs7DcrFJOg+DNPuspSuPGQBmOPmidjLC5ehPKTFJtoFDNf38dohvAAvV9bxuJWw2BFDbyTQrSnP3k2DwGZDku+CdZiVQ/YkNWGC63sCqafyrEu47hdIYceSjRkZzhWM+y9UbCXLXuLGR3+qoxqrOKT <comment>"
}