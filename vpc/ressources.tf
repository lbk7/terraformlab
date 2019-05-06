resource "aws_vpc" "onboardingterraform" {
  cidr_block = "172.23.0.0/16"

  tags {
    Name = "onboardingterraform"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = "${aws_vpc.onboardingterraform.id}"
  cidr_block = "172.23.1.0/24"

  tags {
    Name      = "subnetpubliconboardingTF"
    Terraform = "yes"
    owner     = "lionel"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = "${aws_vpc.onboardingterraform.id}"
  cidr_block = "172.23.10.0/24"

  tags {
    Name      = "subnetprivateonboardingTF"
    Terraform = "yes"
    owner     = "lionel"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.onboardingterraform.id}"

  tags {
    Name = "onboardingigw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = "${aws_vpc.onboardingterraform.id}"

  tags {
    Name = "publiconboardingrt"
  }
}

resource "aws_route" "routepublic" {
  route_table_id         = "${aws_route_table.rt.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gw.id}"
}

resource "aws_route_table_association" "assortpub" {
  subnet_id      = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.rt.id}"
}
