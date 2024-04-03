
package com.emergentes;

public class Estudiante {
    private int id;
    private String nombre;
    private int pp;
    private int sp;
    private int tp;

    public Estudiante() {
        this.id=0;
        this.nombre="";
        this.pp=0;
        this.sp=0;
        this.tp=0;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPp() {
        return pp;
    }

    public void setPp(int pp) {
        this.pp = pp;
    }

    public int getSp() {
        return sp;
    }

    public void setSp(int sp) {
        this.sp = sp;
    }

    public int getTp() {
        return tp;
    }

    public void setTp(int tp) {
        this.tp = tp;
    }
    
    
}
