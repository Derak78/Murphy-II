use <krabice.scad>;
use <profily.scad>;
use <Kola.scad>;
use <drzak_kol.scad>;
use <drzak_napravy.scad>;
use <drzak_vahadla.scad>;
use <knihovna.scad>;
use <paka_lozisko2.scad>;

sirka_tela = 268;
delka_predek = 220;
delka_zadek = 220;
vyska_tela = 80;
vyska_mustku = 400;
delka_napravy = 400;
predsunuti_rampy = 360;
delka_rampy = 540;

module mustek(){
    translate([0,sirka_tela/2-15,vyska_tela+5])
        profil_30x30(vyska_mustku-30);
    translate([0,-sirka_tela/2+15,vyska_tela+5])
        profil_30x30(vyska_mustku - 30);
    translate([0,sirka_tela/2,+20+vyska_tela+vyska_mustku-30])
        rotate([90,0,0])
            profil_30x30(sirka_tela);
    
    translate([0,(sirka_tela-60)/2,+20+vyska_tela+30])
        rotate([90,0,0])
            profil_30x30(sirka_tela-60);
    translate([0,(sirka_tela-60)/2,+20+vyska_tela+30+251+30])
        rotate([90,0,0])
            profil_30x30(sirka_tela-60);


}

mustek();

module vahadlo(){
    translate([-15,(sirka_tela+52+20)/2,0])
        rotate([90,0,0])
            profil_30x5(sirka_tela+52+20);
   // #cylinder(d=sirka_tela+52+20,h=5);
}

module telo(){
    translate([delka_predek-45-121,0,0])
        krabice();
    translate([-(delka_zadek-55),0,0]){
        krabice();
        translate([121/2,0,74])color("Red",1)cylinder(d=40,h=20);
    }    
    translate([-(delka_zadek-45),(sirka_tela/2-15),20])
        rotate([0,90,0])
            profil_30x30(delka_predek+delka_zadek-90);
    translate([-(delka_zadek-45),-(sirka_tela/2-15),20])
        rotate([0,90,0])
            profil_30x30(delka_predek+delka_zadek-90);        
            
    translate([-(delka_zadek-45),(sirka_tela/2-15),20+vyska_tela - 30])
        rotate([0,90,0])
            profil_30x30(delka_predek+delka_zadek-90);
    translate([-(delka_zadek-45),-(sirka_tela/2-15),20 + vyska_tela - 30])
        rotate([0,90,0])
            profil_30x30(delka_predek+delka_zadek-90);                
            
    translate([delka_predek-30,sirka_tela/2,20])
        rotate([90,0,0])
            profil_30x30(sirka_tela);
            
    translate([delka_predek-30,sirka_tela/2,20+ vyska_tela - 30])
        rotate([90,0,0])
            profil_30x30(sirka_tela); 
            
    translate([-(delka_zadek - 30),sirka_tela/2,20])
        rotate([90,0,0])
            profil_30x30(sirka_tela);        
    
    translate([-(delka_zadek - 30),sirka_tela/2,20+vyska_tela - 30])
        rotate([90,0,0])
            profil_30x30(sirka_tela);
    
    translate([delka_predek-15,-(60),20 + vyska_tela - 30])
        rotate([0,90,0])
            profil_30x30(predsunuti_rampy-30-delka_predek);    
            
    translate([delka_predek-15,(60),20 + vyska_tela - 30])
        rotate([0,90,0])
            profil_30x30(predsunuti_rampy-30-delka_predek);    
            
    translate([predsunuti_rampy-30,delka_rampy/2,20 + vyska_tela - 30])
        rotate([90,0,0])
            profil_30x30(delka_rampy);        

            
    translate([-(delka_zadek-30),0,vyska_tela+15]){        
        rotate([180,0,90])
            uchyt_vahadla();
        color("Silver",1)
            cylinder(d=15,h=23,$fn=6);
    //    translate([155,sirka_tela/2+16+10,24.5])
    //        rotate([180,-90,90])
    //            kloub();
        translate([0,sirka_tela/2+16+10,25])
            rotate([0,0,90])
                kloub();
    //    translate([155,-sirka_tela/2-16-10,24.5])
    //        rotate([180,90,90])
    //            kloub();
        translate([0,-sirka_tela/2-16-10,25])
            rotate([0,0,90])
                kloub();
        rotate([0,0,0])
        translate([0,0,34])
            color("Silver",1)vahadlo();
        translate([0,0,34])
            rotate([180,0,90])
                paka_lozisko();
        translate([0,0,34+5])
            rotate([0,0,90])
                paka_lozisko();
        translate([0,0,26.5])        
            lozisko608zz();
        translate([0,0,26.5+5+15])        
            lozisko608zz();    
    } 
    translate([0,-(sirka_tela/2+5),vyska_tela/2+5])
        rotate([0,90,90]) 
            uchyt_napravy(); 
     translate([0,+(sirka_tela/2+5),vyska_tela/2+5])
        rotate([0,90,-90]) 
            uchyt_napravy();    
   
}

telo();

//vcolor("Blue",0.5)translate([0,0,129])cube([500,500,1],center=true);

module naprava(){
    translate([0,0,35]){
        translate([0,15,-30-5])
            rotate([90,0,0]){
                //cylinder(d=10,h=50);
                translate([0,-1,-2])color("Red",1)cylinder(d=30,h=39);
                translate([0,-1,35])
                    rotate([0,180,-90])
                        kloub_napravy();
            }        
        translate([-delka_napravy/2,0,0])
            rotate([0,90,0])
                profil_30x30(delka_napravy);
        translate([delka_napravy/2-25,78,-20.5]){
            translate([0,-78,0])
                drzak_kola();
            rotate([90,0,0])
                kolo();
        }    
        translate([-delka_napravy/2+25,78,-20.5]){
            translate([0,-78,0])
                drzak_kola();            
            rotate([90,0,0])
                kolo();
        }
        
                translate([-10,-29,40])
            rotate([180,-90,90])
                kloub();

        
        translate([0,-20,-36])
        rotate([90,0,0]) 
        color("Silver",1)
            cylinder(d=15,h=30,$fn=6);
    }            
}

module napravy(uhel){
    rozestup = sirka_tela/2+15+30+10;
    translate([0,rozestup,20+15+11])
        rotate([0,uhel,0])
            naprava();
    translate([0,-rozestup,20+15+11])
        rotate([0,-uhel,0])
            mirror([0,1,0]) naprava();
}
napravy(10);
//square([500,500],center=true);
//square([350,250],center=true);
//square([237,237],center=true);
//translate([0,0,100])square([200,200],center=true);


color("DarkSlateGray",1){
    translate([0,0,45])
        rotate([90,0,0])
            cylinder(d=10,h=440,center=true);
}    



module sud(){
    color("Green",1)
    cylinder(d=172,h=251);
}

translate([0,0,145])sud();