package model.employee;

import java.util.Date;

public class Employee {
    private int positionId,degreeId,status,divisionId,id;
    private String name,birthday,cardId,phone,email,address,userName;
    private double salary;

    public Employee(int id,
                    String name,
                    String birthday,
                    String cardId,
                    double salary,
                    String phone,
                    String email,
                    String address,
                    int positionId,
                    int degreeId,
                    int divisionId,
                    String userName,
                    int status
                    ) {
        this.divisionId=divisionId;
        this.positionId = positionId;
        this.degreeId = degreeId;
        this.status = status;
        this.name = name;
        this.birthday = birthday;
        this.cardId = cardId;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.userName = userName;
        this.salary = salary;
        this.id=id;
    }

    public Employee(String name,
                    String birthday,
                    String cardId,
                    double salary,
                    String phone,
                    String email,
                    String address,
                    int positionId,
                    int degreeId,
                    int divisionId,
                    String userName,
                    int status
    ) {
        this.divisionId=divisionId;
        this.positionId = positionId;
        this.degreeId = degreeId;
        this.status = status;
        this.name = name;
        this.birthday = birthday;
        this.cardId = cardId;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.userName = userName;
        this.salary = salary;
    }


    public Employee(String name,
                    String birthday,
                    String cardId,
                    double salary,
                    String phone,
                    String email,
                    String address,
                    int positionId,
                    int degreeId,
                    int divisionId,
                    String userName) {
        this.positionId = positionId;
        this.degreeId = degreeId;
        this.divisionId = divisionId;
        this.name = name;
        this.birthday = birthday;
        this.cardId = cardId;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.userName = userName;
        this.salary = salary;
    }

    public int getDivisionId() {
        return divisionId;
    }

    public void setDivisionId(int divisionId) {
        this.divisionId = divisionId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public int getPositionId() {
        return positionId;
    }

    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }

    public int getDegreeId() {
        return degreeId;
    }

    public void setDegreeId(int degreeId) {
        this.degreeId = degreeId;
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

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }
}
