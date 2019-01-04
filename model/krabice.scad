otvory_prumer=5;
odkrajeY=6+otvory_prumer/2;
odkrajeX=19+otvory_prumer/2;
delkaC=255;
delkaB=200;
sirka=120;
radius=5;

module krabice(){
    color("Pink")
    difference(){
        union(){
            linear_extrude(height=75){
                minkowski(){
                    translate([(sirka-2*radius)/2,0])
                    circle(radius);
                    square([sirka-2*radius,delkaB-2*radius],center=true);
                }
            }    
            linear_extrude(height=5){
                minkowski(){
                    translate([(sirka-2*radius)/2,0])
                    circle(5);
                    square([sirka-2*radius,delkaC-2*radius],center=true);
                }
            }
        }
        for(a=[odkrajeX:sirka-2*odkrajeX:sirka-odkrajeX]){
            for(b=[odkrajeY-delkaC/2:delkaC-2*odkrajeY:delkaC/2-odkrajeY]){
                translate([a,b,-1])
                    cylinder(d=otvory_prumer,h=10,$fn=20);
            }
        } 
        
    }   
}

krabice();