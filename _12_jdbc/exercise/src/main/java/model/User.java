package model;

public class User {
    protected int id,status;
    protected String name;
    protected String email;
    protected String country;

    public User( String name, String email, String country,int status) {
        this.status = status;
        this.name = name;
        this.email = email;
        this.country = country;
    }

    public User(int id, String name, String email, String country, int status) {
        this.id = id;
        this.status = status;
        this.name = name;
        this.email = email;
        this.country = country;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
