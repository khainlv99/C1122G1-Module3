package com.baitap1;

public class Student {
    private int id;
    private String name;
    private String sex;
    private int point;

    public Student(int id, String name, String sex, int point) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.point = point;
    }

    public Student(String name, String sex, int point) {
        this.name = name;
        this.sex = sex;
        this.point = point;
    }

    public Student() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", point=" + point +
                '}';
    }
}
