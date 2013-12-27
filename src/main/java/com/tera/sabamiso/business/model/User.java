/**
 * 
 */
package com.tera.sabamiso.business.model;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;

/**
 * @author usr160056
 * 
 */
public class User {
    @NotNull
    @Size(min = 3, max = 3)
    private String id;

    @NotNull
    @Size(min = 1)
    private String name;

    @NotNull
    @Range(min = 10, max = 99)
    private int age;

    private Date upDate; // çXêVì˙

    public User() {
    }

    public User(String id, String name) {
        this.id= id;
        this.name= name;
        this.upDate = new Date();
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Date getUpDate() {
        return upDate;
    }

    public void setUpDate(Date upDate) {
        this.upDate = upDate;
    }

}
