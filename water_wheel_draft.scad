spoke=[75,3,10];
wheel_h=5;
wheel_r1=40;
wheel_r2=40;


cylinder(wheel_h,wheel_r1,wheel_r2);

translate([0,0,15])
{
	cylinder(wheel_h,wheel_r1,wheel_r2);
}

translate([-75/2,0,5])
{
	cube(spoke);
}

rotate([0,0,90])
{
	translate([-75/2,0,5])
	{
		cube(spoke);
	}
}

rotate([0,0,45])
{
	translate([-75/2,0,5])
	{
		cube(spoke);
	}
}

rotate([0,0,-45])
{
	translate([-75/2,0,5])
	{
		cube(spoke);
	}
}