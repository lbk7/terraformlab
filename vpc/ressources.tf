resource "aws_vpc" "onboardingterraform" {
  cidr_block = "172.23.0.0/16"

  tags {
    Name = "onboardingterraform"
  }
}
