//get rid of bullet if we havent shot it yet\
if instance_exists( bulletInst ) && bulletInst.state = 0
{
	bulletInst.destroy = true;
}