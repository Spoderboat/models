scale=1; //makes it easier to scale the model.  If scale=1, the diameter will be 100mm

spoke_length=45*scale;
spoke_width=3*scale;
spoke_height=15*scale;
spoke=[spoke_length,spoke_width,spoke_height];

hole_r=(spoke_width/2.1)*scale;

wheel_h=3*scale;
wheel_r=50*scale;

spoke_translate=[-spoke_length/2,0,spoke_height/2+wheel_h];

translate([2*(wheel_r)+2,0,0])//top wheel
{
difference()
{
	cylinder(wheel_h,wheel_r,wheel_r);
	translate([0,0,-scale/2]){cylinder(wheel_h+scale,hole_r,hole_r);}
}
}


difference(){
union(){
cylinder(wheel_h,wheel_r,wheel_r);//bottom wheel

for(a=[0:45:315]) //spokes (for loop rotates them around axis)
{
	rotate([0,0,a])
	{
		translate(spoke_translate)
		{
			cube(spoke,true);
		}
	}
}}
translate([0,0,-scale/2]){cylinder((2*wheel_h)+spoke_height+scale,hole_r,hole_r);}
}