scale=1; //makes it easier to scale the model.  If scale=1, the radius will be 100mm

spoke_length=95*scale;
spoke_width=3*scale;
spoke_height=15*scale;
spoke=[spoke_length,spoke_width,spoke_height];

wheel_h=3*scale;
wheel_r=50*scale;

spoke_translate=[-spoke_length/2,0,wheel_h];


cylinder(wheel_h,wheel_r,wheel_r);//bottom wheel

translate([0,0,spoke_height])//top wheel
{
	cylinder(wheel_h,wheel_r,wheel_r);
}

for(a=[0:45:135]) //spokes (for loop rotates them around axis)
{
	rotate([0,0,a])
	{
		translate(spoke_translate)
		{
			cube(spoke);
		}
	}
}
