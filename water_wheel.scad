scale=1; //makes it easier to scale the model.  If scale=1, the diameter will be 100mm

spoke_length=45*scale;
spoke_width=3*scale;
spoke_height=15*scale;
spoke=[spoke_length,spoke_width,spoke_height];

axle_r=(spoke_width)*scale;

wheel_h=3*scale;
wheel_r=50*scale;

axle_guard=wheel_r*.25;

spoke_translate=[-spoke_length/2,0,spoke_height/2+wheel_h];

translate([2*(wheel_r)+2,0,0])//top wheel
{
difference()
{
	cylinder(wheel_h,wheel_r,wheel_r);//second rim
	translate([0,0,-scale/2]){cylinder(wheel_h+scale,axle_r,axle_r);}//axle hole

//stabilizing holes
translate([spoke_length*.8,0,-.5])
{
	cylinder(wheel_h+spoke_height+1,spoke_width*.5,spoke_width*.5);
}
translate([-spoke_length*.8,0,-.5])
{
	cylinder(wheel_h+spoke_height+1,spoke_width*.5,spoke_width*.5);
}
translate([0,-spoke_length*.8,-.5])
{
	cylinder(wheel_h+spoke_height+1,spoke_width*.5,spoke_width*.5);
}
translate([0,spoke_length*.8,-.5])
{
	cylinder(wheel_h+spoke_height+1,spoke_width*.5,spoke_width*.5);
}
}
}


difference(){
union(){
cylinder(wheel_h,wheel_r,wheel_r);//bottom wheel

cylinder(wheel_h+spoke_height,axle_guard,axle_guard);

for(a=[0:45:315]) //spokes (for loop rotates them around axis)
	{
	rotate([0,0,a])
	{
		translate(spoke_translate)
		{
			cube(spoke,true);
		}
	}
	}

//these four cylinders are the guards for the stabilizing holes along the spokes
translate([spoke_length*.8,0,0])
{
	cylinder(wheel_h+spoke_height,spoke_width*1.25,spoke_width*1.25);
}
translate([0,spoke_length*.8,0])
{
	cylinder(wheel_h+spoke_height,spoke_width*1.25,spoke_width*1.25);
}
translate([-spoke_length*.8,0,0])
{
	cylinder(wheel_h+spoke_height,spoke_width*1.25,spoke_width*1.25);
}
translate([0,-spoke_length*.8,0])
{
	cylinder(wheel_h+spoke_height,spoke_width*1.25,spoke_width*1.25);
}


}//end of union

translate([0,0,-scale/2])
{
	cylinder((2*wheel_h)+spoke_height+scale,axle_r,axle_r);
}

//these four cylinders are the stabilizing holes
translate([spoke_length*.8,0,-.5])
{
	cylinder(wheel_h+spoke_height+1,spoke_width*.5,spoke_width*.5);
}
translate([-spoke_length*.8,0,-.5])
{
	cylinder(wheel_h+spoke_height+1,spoke_width*.5,spoke_width*.5);
}
translate([0,-spoke_length*.8,-.5])
{
	cylinder(wheel_h+spoke_height+1,spoke_width*.5,spoke_width*.5);
}
translate([0,spoke_length*.8,-.5])
{
	cylinder(wheel_h+spoke_height+1,spoke_width*.5,spoke_width*.5);
}

}