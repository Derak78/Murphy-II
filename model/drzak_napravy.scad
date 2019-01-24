sirka_ramene2 = 40;
sirka_ramene1 = 50;
delka_uchytu = 80;
m6_dira = 7;
m5_dira = 6;
drazka = 8;
m10_dira = 10.8;
delka_ramene = 30;
tloustka_hlavy = 8;
hlava_d1 = 15;
hlava_d2 = 20;
vyska_tela = 80;
delka_uchytu_napravy = 60;
vrstva = 0.3;
profil_rezerva = 0.2;


module uchyt_rameno(){
    difference(){
       union(){
          hull(){ 
            translate([0,-delka_uchytu/2,0])
                cube([5,delka_uchytu,35]);
            translate([5+30,-sirka_ramene1/2,0])
                cube([5,sirka_ramene1,35]); 
          }
          hull(){
                translate([5+30,-sirka_ramene1/2,0])
                    cube([5,sirka_ramene1,35]); 
                translate([30+delka_ramene,sirka_ramene2/2-hlava_d2/2,0])
                    cylinder(d=hlava_d2,h=tloustka_hlavy);
                translate([30+delka_ramene,-sirka_ramene2/2+hlava_d2/2,0])
                    cylinder(d=hlava_d2,h=tloustka_hlavy);              
          }  
        }
        difference(){
            translate([5,-delka_uchytu/2-1,5])
                cube([30+profil_rezerva,delka_uchytu+2,30+1]);
            translate([5+15+profil_rezerva/2-drazka/2,-delka_uchytu/2-1,5])
                cube([drazka,delka_uchytu+1,2]);            
        }
        
        translate([5+15+profil_rezerva/2,15,0])
            cylinder(d=m6_dira,h=20,center = true);
        translate([5+15+profil_rezerva/2,-15,0])
            cylinder(d=m6_dira,h=20,center = true);

        translate([5+30,15,5+15])
            rotate([0,90,0])
                cylinder(d=m6_dira,h=20,center = true);
        translate([5+30,-15,5+15])
            rotate([0,90,0])
                cylinder(d=m6_dira,h=20,center = true);
 
        
        translate([5+30+5,2,tloustka_hlavy])
            cube([delka_ramene,delka_uchytu/2,30+1]);
        translate([5+30+5,-2-delka_uchytu/2,tloustka_hlavy])
            cube([delka_ramene,delka_uchytu/2,30+1]);
        
                        translate([30+delka_ramene,sirka_ramene2/2-hlava_d2/2,3])
                    cylinder(d=hlava_d1,h=tloustka_hlavy);
                translate([30+delka_ramene,-sirka_ramene2/2+hlava_d2/2,3])
                    cylinder(d=hlava_d1,h=tloustka_hlavy);
           
                        translate([30+delka_ramene,sirka_ramene2/2-hlava_d2/2,-1])
                    cylinder(d=m5_dira,h=tloustka_hlavy+2);
                translate([30+delka_ramene,-sirka_ramene2/2+hlava_d2/2,-1])
                    cylinder(d=m5_dira,h=tloustka_hlavy+2);

    }
}

module kloub_napravy(){
    difference(){
        union(){ 
            translate([-10,-delka_uchytu/2,0])
                cube([30,delka_uchytu,35]);
            cylinder(d=40,h=35);
            translate([15.5,0,0])
                uchyt_rameno();
        }
        translate([0,30,15+5])
            rotate([0,90,0])    
                cylinder(d=m6_dira,h=50,center = true);
        translate([0,-30,15+5])
            rotate([0,90,0])    
                cylinder(d=m6_dira,h=50,center = true);    
        translate([0,0,-1])
            cylinder(d=30-6,h=37);
        translate([0,0,-1])
            cylinder(d=30+1,h=11);
        translate([0,0,35-10])
            cylinder(d=30+1,h=11);    
    }
    //mustek pro snazsi tisk
  //  translate([0,0,10])
  //      cylinder(d=30-6,h=vrstva);
} 

//uchyt_rameno();
//kloub_napravy();

module uchyt_napravy(){
    difference(){
        union(){
            translate([-vyska_tela/2,-delka_uchytu_napravy/2,0]) //horizontalni cast
                cube([vyska_tela,delka_uchytu_napravy,5]);
            translate([-(vyska_tela/2 - 30/2 + drazka/2),-delka_uchytu_napravy/2,0])
                cube([drazka,delka_uchytu_napravy,7]);
            translate([+(vyska_tela/2 - 30/2 - drazka/2),-delka_uchytu_napravy/2,0])
                cube([drazka,delka_uchytu_napravy,7]);
            
            hull(){
                translate([-(vyska_tela-60-0.6)/2,-delka_uchytu_napravy/2,0])
                    cube([vyska_tela-60-0.6,delka_uchytu_napravy,5]);
                translate([-(vyska_tela-60-0.6)/2,-(vyska_tela-60)/2,0])
                    cube([vyska_tela-60-0.6,vyska_tela-60,30+5]);
            }
            
            translate([-(vyska_tela/2+30),-30/2,0])   // vertikalni cast
                cube([(vyska_tela+30),30,5]);            
            translate([-(vyska_tela/2+30),-drazka/2,0])
                cube([(30-2),drazka,7]);                                 
        }    
        translate([0,0,-1])
            cylinder(d = m10_dira,h=30+5+2);
        for(y=[-15:30:15])
            for(x=[-(vyska_tela/2-15):vyska_tela-30:vyska_tela/2-15])
                translate([x,y,-1])
                    cylinder(d=m6_dira,h=10);
        translate([-(vyska_tela/2+15),0,-1])
                cylinder(d=m6_dira,h=10);
    }    
}

uchyt_napravy();