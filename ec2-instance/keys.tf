resource "aws_key_pair" "anhdo_key" {
    key_name = "anhdo_tf_key"
    public_key = file("/home/anhdo/TH_terraform/dev-vpc_test/ssh-keys/anhdo-key.pub")
}